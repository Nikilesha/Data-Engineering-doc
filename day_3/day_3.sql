-- create a table with name , id , birth date , phone number 

create table persons(
	id int not null,
	person_name varchar(25),
	birth_date date,
	phone varchar(15) not null,
	constraint pk_persons primary key (id)
)



-- alter the table and add a new column called email

alter table persons
add email varchar(25) not null;



-- remove the phone column from the table

alter table persons 
drop column phone;



-- delete the persons table from the database

drop table persons;

-- insert new values into customers table

insert into customers(id,first_name,country,score)
values
	(6,'anna','USA',NULL),
	(7,'sam',Null,100)



--copy customers table into persons table

insert into persons(id,person_name,birth_date,phone)
select 
id,first_name,NULL,'Unknown'
from customers;


-- change the score of customer with id 6 to 0

update customers
set score = 25,
	country = 'UK'
where id=6 ; 


-- delete all customers with an id greater than 5

delete from customers where id >5;

-- delete all data from persons table

truncate table customers;




