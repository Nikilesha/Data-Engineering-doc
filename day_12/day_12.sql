-- sort the customers from lowest to highes with null in the last
select *
from sales.Customers
order by score desc;
-- find the sales price for each order by dividing the sales by the quantity
select OrderID,
	sales,
	quantity,
	sales / nullif(Quantity, 0) as yess
from sales.Orders