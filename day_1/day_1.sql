-- selecting an entire table

/*
select *
from customers

select * 
from orders
*/

-- selecting specific items in the table
/*
select
	first_name,
	country,
	score
from customers;
*/

-- retrive customers with a score not equal to 0 using where clause
/*
select 
	first_name,
	country
from customers
where score != 0;
*/
-- retrieve customers from germany alone
/*
select 
	first_name,
	score,
	country
from customers
where country = 'Germany';
*/


-- select the customers table using an order by clause and sort results by highest score first
/*
select *
from customers
order by score desc;
*/

-- select the customers table using an order by clause and sort results by lowest score first

/*
select * 
from customers
order by score asc;
*/

-- selec the customers table using nested order by clause
/*
SELECT * 
from customers
order by country ASC , score DESC;
*/