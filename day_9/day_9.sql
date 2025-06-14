-- round function
select round(3.153220, 2) as num
from customers;
-- abs function
select abs(3.25) as num
from customers;
--date and time function
select orderID as order_id,
    orderDate as ordered_date,
    shipDate as shipped_date,
    creationTime as created_time,
    getdate() as Today
from sales.orders;
--part extraction
-- date and time functions
select day(creationTime) day,
    month(creationTime) month,
    year(creationTime) year
from sales.orders;
-- datepart
select datepart(year, creationTime) as nn,
    datepart(month, creationTime) as ns,
    datepart(day, creationTime) as nd,
    datepart(hour, creationTime) as nh,
    datepart(MINUTE, creationTime) as nm,
    datepart(quarter, creationTime) as nq,
    datepart(week, creationTime) as nw
from sales.Orders;
--datename
-- always returns string value
select DATENAME(month, CreationTime) as month_dp,
    DATENAME(weekday, CreationTime) as day_dp,
    DATENAME(month, CreationTime) as month_dp,
    DATENAME(year, CreationTime) as year_dp
from sales.Orders;
-- datetrunc
select creationTime as c,
    DATETRUNC(MINUTE, CreationTime) as dp,
    DATETRUNC(month, CreationTime) as dt
from sales.Orders -- EOMonth
    -- returns last day of month
select EOMONTH(CreationTime) as cd
from sales.Orders -- count the number of orders were placed in each month
select datename(month, OrderDate) as month,
    count(*) as no_of_months
from sales.Orders
group by datename(month, OrderDate)
order by datename(month, orderdate) desc;
--show all orders that were places during month of feburary
select *
from sales.Orders
where month(OrderDate) = 2;