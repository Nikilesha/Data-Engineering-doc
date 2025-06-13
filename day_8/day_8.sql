-- show list of customers' first name together with their country in one column

select 
	first_name,
	country,
	concat(first_name,' ',country) as name_with_country
from customers;


-- convert first name to lower case

select 
	lower(first_name) as cusomters,
	upper(first_name) as caps_customers
from customers; 


-- find customers whose first name contains leading or trailing spaces and find length of first_name

 select
	first_name,
	len(first_name)
from customers

where first_name != trim(first_name)



-- remove dashes (-) from a phone number

select 
'123-456-7890',
replace('123-456-7890','-','/')


-- retrieve the frist 2 characters from left and right from first name

select 
	first_name as names,
	left(first_name,2) as left_codes,
	right(first_name,2) as right_codes
from customers;


-- retrieve a list of customers first name removing the first character
select 
	first_name,
	substring(first_name,2,len(first_name)) as codes
from customers;


