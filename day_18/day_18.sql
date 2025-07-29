-- Ranking functions
-- row_number()
-- just gives the unique rank value of the number
-- Rank the orders based on their sales from highest to lowest
select sales,
    ROW_NUMBER() over(
        order by sales desc
    ) as ranks
from sales.Orders -- rank
    -- it ranks leaving gaps and managing ties
select sales,
    rank() over(
        order by sales desc
    ) as ranks
from sales.Orders;
-- dense ranks
-- it ranks without leaving gaps and it handles ties
select sales,
    DENSE_RANK() over(
        order by sales desc
    ) as ranks
from sales.Orders;
-- all together
select sales,
    ROW_NUMBER() over(
        order by sales desc
    ) as ranks,
    rank() over(
        order by sales desc
    ) as ranks,
    DENSE_RANK() over(
        order by sales desc
    ) as ranks
from sales.Orders;
-- find the top highest sales for each product
select *
from(
        select OrderID,
            ProductID,
            sales,
            row_number() over(
                partition by productID
                order by sales desc
            ) as ranks
        from sales.Orders
    ) t
where ranks = 1;
-- find the lowest 2 customers based on their total sales
select *
from(
        select CustomerID,
            sum(sales) as total_sales,
            ROW_NUMBER() over(
                order by sum(sales) asc
            ) as ranks
        from sales.Orders
        group by CustomerID
    ) t
where ranks <= 2;
-- Assign unique ID to the rows of orders archive table 
select ROW_NUMBER() over(
        order by orderID,
            OrderDate
    ) as ranks,
    *
from sales.OrdersArchive;
-- identify dupliate rows in the table and return a clean result without any duplicates
select *
from(
        select ROW_NUMBER() over(
                partition by orderID
                order by creationTime desc
            ) as ranks,
            *
        from sales.OrdersArchive
    ) t
where ranks = 1;
--ntile
-- divides roes into equal buckets
-- segment all orders into 3 categories high medium and low sales
select *,
    case
        when ranks = 1 then 'High'
        when ranks = 2 then 'Medium'
        when ranks = 3 then 'Low'
    end segments
from(
        select orderID,
            Sales,
            NTILE(3) over(
                order by sales desc
            ) as ranks
        from sales.Orders
    ) t -- Find the products that fall within the highest 40 % of prices
select *
from(
        select Product,
            price,
            CUME_DIST() over(
                order by price desc
            ) as ranks
        from sales.Products
    ) t
where ranks <= 0.4;