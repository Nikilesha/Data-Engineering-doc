-- format
select orderid,
	creationTime,
	format(creationTime, 'MM') dd,
	format(creationTime, 'MM-dd-yyyy') dd
from sales.Orders;
-- Show creation time using the following format day wed jan q1 2025 12:34:56 PM
select orderid,
	creationTime,
	'Day ' + format(creationTime, 'ddd MMM ') + ' Q' + DATENAME(quarter, CreationTime) + format(creationTime, ' yyyy hh:mm:ss tt')
from sales.orders;
-- convert function
select convert(int, '123') as [String to Int],
	convert(date, '12-03-2025') as [String to date],
	creationTime,
	convert(Date, CreationTime) as [DateTime to date]
from sales.orders;
-- cast function
select cast('123' as INT) as [varchar to int] -- dateAdd()
select orderdate,
	dateadd(year, 2, orderdate) as [After two days],
	dateadd(month, -3, orderdate) as [3 months before],
	dateadd(day, 20, orderdate) as [after 20 days]
from sales.orders;
-- dateDiff()
select employeeid,
	birthdate,
	getdate(),
	datediff(year, BirthDate, GETDATE()) as age
from sales.Employees
-- find the avergae shipping duration in days for each month
select month(orderdate) as order_date,
	avg(datediff(day, orderdate, shipdate)) as [ship]
from sales.Orders
group by month(orderdate)
-- Find the number of day s between each order and previous order
select orderid,
	orderdate,
	lag(orderdate) over (
		order by orderdate
	),
	datediff(
		day,
		lag(orderdate) over (
			order by orderdate
		),
		orderdate
	) as [diff in date]
from sales.Orders