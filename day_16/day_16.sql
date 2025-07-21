select orderID,
    orderDate,
    OrderStatus,
    sales,
    sum(sales) over(
        partition by orderstatus
        order by orderdate rows between current row
            and 2 following
    ) total_sales
from sales.Orders;
-- Find total sales for each order status only for two products 101 and 102
select productid,
    orderstatus,
    sales,
    sum(sales) over(
        partition by productid
        order by productid
    )
from sales.Orders
where ProductID in (101, 102);
-- Rank customers based on their total sales
select CustomerID,
    rank() over(
        order by sum(sales) desc
    ) ranked
from sales.Orders
group by CustomerID;
-- count function
-- find the total number of orders
-- additionally provide details like order id and date
select orderid,
    orderdate,
    count(orderid) over() as total_orders
from sales.Orders;
-- find total orders for each customers
select orderid,
    orderdate,
    count(*) over() as total_sales,
    count(*) over(partition by customerid) as total_customers
from sales.Orders;
-- find the total number of cusomters aditionally provide all cusomter details
select count(*) over()
from Sales.Customers;
-- find the total number of scores for the customers
select *,
    count(*) over() TotalCustomers,
    count(score) over() totalScores
from Sales.Customers;
-- check if any duplicates are there in the table
select distinct orderid,
    count(*) over(partition by orderID) checkPK
from sales.Orders;
-- Find the total sales across all orders and the total sales of each product aditionally provide details such as order id and order date
select orderID,
    orderDate,
    sum(sales) over() total_Sales,
    sum(sales) over(partition by productID)
from Sales.Orders;
-- Find the percentage contribution of each product's sales to the total sales
select orderID,
    productID,
    sum(sales) over() total_Sales,
    round(cast(sales as float) / sum(sales) over() * 100, 2)
from Sales.Orders -- Find the average sales across al orders and the average sales for each product aditionally provide details such as orderid and date
select OrderID,
    OrderDate,
    avg(sales) over(),
    avg(sales) over(partition by productID)
from sales.orders;