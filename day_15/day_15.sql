-- Find total sales across all orders and aditionally provide details such as order id and order date
-- select * from Sales.Orders;
select orderid,
    orderdate,
    sum(sales) over()
from sales.Orders;
-- FInd total sales for each product aditionally provide details such as order id and order date
-- after that find the total sales across all orders
select orderID,
    orderDate,
    productid,
    sales,
    sum(sales) over(),
    sum(sales) over(partition by productID) Total_sales
from Sales.Orders;