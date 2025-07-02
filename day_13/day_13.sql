-- generate a report showing the total sales for each category
-- high: if the sales higher than 50
-- medium: if the sales between 20 and 50
-- low: if the sales equal or lower than 20
-- sort the result from lowest to highest
select orderID,
    sales,
    case
        when sales > 50 then 'Higher'
        when sales > 21 then 'Medium'
        else 'Low'
    end category
from sales.Orders
order by sales asc;
-- retrieve employee details with gender displayed as full text
select firstName,
    lastName,
    BirthDate,
    case
        when Gender = 'M' then 'Male'
        when Gender = 'F' then 'Female'
        else 'Other'
    end full_gender
from sales.Employees -- retrieve customers details with abbreviared country code
select FirstName,
    LastName,
    case
        country
        when 'Germany' then 'DE'
        when 'USA' then 'US'
        else 'n/a'
    end country_code
from sales.Customers -- Find the scores of customers and treat NULLs as 0
    -- additionally provide details such as customerID and last name
select CustomerID,
    LastName,
    case
        when score IS NULL then 0
        else score
    end clean_score
from sales.Customers;