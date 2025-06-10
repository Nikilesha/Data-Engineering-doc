-- using salesDB , retrieve a list of all orders, along with the related customer,product,and employee details
-- for each display the order ID,customer name,product,employee details

select 
	o.OrderID,
	o.sales,
	c.FirstName as customer_name,
	c.LastName as customer_names,
	p.product as product_name,
	p.Price,
	e.FirstName as employee_name,
	e.LastName as employee_names
from sales.orders as o
left join sales.customers as c
on o.CustomerID = c.CustomerID
left join sales.products as p
on o.ProductID = p.ProductID
left join sales.Employees as e
on o.SalesPersonID = e.EmployeeID;


--SET OPERATIONS

select 
	FirstName,
	LastName
from sales.Customers

union 

select 
	FirstName,
	LastName
from sales.Employees;


-- combine the data from employees and customers into one table

select
	firstName,
	LastName,
	country,
	Score
from sales.customers
union
select
	firstName,
	LastName,
	Department,
	Salary
from sales.Employees;


-- union all
-- combine the data from employees and customers into one table including duplicates

select 
	firstName,
	lastName,
	country,
	score
from sales.Customers
union all
select 
	firstName,
	LastName,
	Department,
	Salary
from sales.Employees


-- except set operator
-- find the employees who are not customers at the same time

select 
	firstName,
	lastName
from sales.Employees
except
select 
	firstName,
	LastName
from sales.Customers


 -- Intersect set operator
 --Find employees who are also customers

 select 
	firstName,
	LastName
from sales.customers
intersect
select 
	firstName,
	lastName
from sales.Employees;



