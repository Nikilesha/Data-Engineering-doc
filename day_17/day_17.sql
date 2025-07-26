-- Find the average score of customers
-- additionally provide details such as customerID and LastName

select 
	CustomerID,
	LastName,
	coalesce(score,0) customerScore,
	avg(Score) over() as scores
from sales.Customers;

-- Find all orders where sales are higher than average sales across all orders

select
* 
from(
select 
	orderID,
	productID,
	sales,
	avg(sales) over() avgsales
from sales.Orders
)t where sales > avgsales;

-- Find the highest and lowest sales across all orders
-- and the highest and lowest sales for each product
-- Aditionally provide details such as orderid and order date

select
	orderID,
	OrderDate,
	sales,
	min(sales) over(partition by productID) as minSales,
	max(sales) over(partition by productID) as maxSales
from sales.Orders;



-- show the employess who have the highest salaries


select 
*
from(
	select 
		*,
		max(salary) over() highestSalary
	from sales.Employees
)t where salary = highestSalary;


