-- AGGEREGATE FUNCTIONS
--Find the total number of customers
select count(customer_id) as total_customers
from orders;
-- Find total sales of all orders
select sum(sales) as total_sales
from orders;
-- Find the average sales of all orders
select avg(sales) as avg_sales
from orders;
-- Find the highest and lowest sales among customers
select max(sales) as high_sales,
    min(sales) as low_sales
from orders;
-- Find the scores in customers table
select sum(score) as cust_sum,
    avg(score) as cust_avg,
    max(score) as cust_max,
    min(score) as cust_min
from customers;
-- Window functions
-- Find total sales for each product using group by
select productid,
    sum(sales)
from Sales.Orders
group by productID;
-- Find the total sales for each product additionally prove details such orderid and order date
select OrderID,
    OrderDate,
    productid,
    sum(sales) over(partition by productid) totalSales
from Sales.Orders