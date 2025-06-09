-- right anti join 
-- get all orders without matching customers

select *
from customers as c
right join orders as o
on c.id = o.customer_id
where c.id is NULL;


--get all orders without matching customers using left join 


select *
from orders as o 
left join customers as c
on c.id = o.customer_id
where c.id is NULL


-- full anti join 
-- find orders without customers and orders without customers

select *
from customers as c
full join orders as o
on c.id = o.customer_id
where c.id is NULL or o.customer_id is NULL


--get all customers along with their orders, but only for customers who have placed an order (without inner join)

select *
from customers as c
left join orders as o
on c.id = o.customer_id
where  o.customer_id is not NULL


-- generate all possible combinations of customer with orders

select *
from customers
cross join orders;

