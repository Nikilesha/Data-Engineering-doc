-- Retrieve all customers from Germany

select
	first_name,
	country
from customers
where country = 'Germany';

-- Retrieve all customers not from Germany

select
	first_name,
	country
from customers
where country != 'Germany'

-- Retrieve all customers with score greater than 500

select *
from customers
where score > 500;



-- Retrieve all customers who are from usa and with a score greater than 500

select *
from customers
where country = 'USA' and score > 500;


-- Retrieve all customers who are from usa or with a score greater than 500

select * 
from customers
where country = 'USA' or score > 500;



-- Retrieve all customers who are not from usa

select * 
from customers
where not country = 'USA';


-- Retrieve all customers whose score is between 100 and 500

select * 
from customers
where score between 100 and 500;


-- Retrieve all customers who are from usa and germany with membership operator

select *
from customers
where country in ('USA','Germany');


-- Retrieve all customers who's name starts with 'M'

select * 
from customers
where first_name like 'M%';




-- Retrieve all customers who's name ends with 'n'

select *
from customers
where first_name like '%n';


-- Retrieve all customers who's name has an 'r' in the third position

select *
from customers
where first_name like '__r%';


-- retrieve all data from customers and orders as seperate results

select * from customers;

select * from orders;


-- get all customers along with their orders but only for customers who have paid for their orders

select 
	c.id,
	c.first_name,
	o.order_date,
	o.sales
from customers as c
inner join orders as o
on c.id = o.customer_id;


-- get all the customers along with their orders including those without orders

select *
from customers as c
left join orders as o
on c.id = o.customer_id;


-- get all the customers along with their orders including those without matching customers

select *
from customers as c
right join orders as o
on c.id = o.customer_id;


-- get all the customers and orders without any match

select *
from customers as c
full join orders as o
on c.id = o.customer_id;


-- get all customers who haven't placed any order

select *
from customers as c
left join orders as o
on c.id = o.customer_id
where o.customer_id is NULL

