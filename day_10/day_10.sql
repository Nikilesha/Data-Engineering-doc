-- Show total sales per customer.
select customerID,
    sum(sales) as totalsales
from sales.Orders
group by CustomerID;
--Find the top 5 products by quantity sold.
select top 5 productID,
    sum(quantity) as total_qty
from sales.Orders
group by productID -- Display monthly sales trends.
select DATENAME(month, creationTime) as month,
    sum(sales) as sales_sum
from sales.Orders
group by DATENAME(month, creationTime);
--Identify the customers who placed the highest number of orders.
select customerID,
    sum(quantity) as qty
from sales.Orders
group by CustomerID;
--Find orders that took more than 7 days to ship.
select orderID,
    datediff(day, orderdate, shipdate) as shipping_time
from sales.Orders
where datediff(day, orderdate, shipdate) > 7;