-- finding the total score of each country using group by clause

select 
	country as customer,

	sum(score) as score 
from customers
group by country




-- finding the total score and total number of customers for each country

select
	country,
	sum(score) as total_score,
	count(first_name) as total_customers
from customers
group by country;



-- find the average score for each country considering only customers with a score not equal to 0 and return those countries with average score greater than 430

select
	country,
	avg(score) as average_scores
from customers
where score >0
group by country
having avg(score) > 430


-- return unique list of all countries

select distinct
	country
from customers;


-- retrieve top 3 customes with highest scores

select top 3 *
from customers
order by score desc;


--select the two most recent orders from the orders table

select top 2 * 
from orders
order by order_date desc;
