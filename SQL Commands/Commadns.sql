create database ChurnTable;

use ChurnTable;

select *  from customer_data;
describe customer_data;

alter table customer_data modify Customer_ID varchar(100) primary key;    #if you want to change datatype as well we can use this

alter table customer_data drop primary key;                    # dropping the primary key

ALTER TABLE customer_data ADD  PRIMARY KEY (Customer_ID(20));         # if we want to keep the datatype as text jsut specify the length



# total Customers 
select count(*) as TotalCustomers 
from customer_data;


#total churncustomers
select * from customer_data;
select customer_status ,count(*) as total_churn 
from customer_data
where customer_status = "Churned";



#Percentage of churn rate from total customers
select customer_status, 
concat(format(count(customer_status) * 100 / (select count(*) from customer_data),2),'%') as percentage
from customer_data 
group by customer_status 
having customer_status='Churned';



#New Joined
select customer_status, count(*) as total_customer
from customer_data 
where customer_status = 'Joined';



#Gender wise churn rate
select Gender,count(*) total_customers,
concat(format(count(gender) * 100 / (select count(*) from customer_data),2),"%") as Percentage 
from customer_data 
group by gender;



#state wise total and percentage
select state, count(state) as total_states,
concat(format(count(state) * 100 /(select count(*) from customer_data),2),'%') as percentage from customer_data group by state;



#total revenue and percentage of customer_status
select customer_status,
format(sum(total_revenue),2) as total_revenue,
concat(format(sum(total_revenue) / (select sum(total_revenue) from customer_data) * 100,2),'%') as percentage
from customer_data 
group by customer_status;



#churn rate by contract and total 
select contract,count(*) as total ,
concat(format(count(contract)* 100 / (select count(*) from customer_data),2),'%') as ratebycontract
from customer_data 
group by contract 
order by total;

#Retreve all the column names from the table 
SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'customer_data';






