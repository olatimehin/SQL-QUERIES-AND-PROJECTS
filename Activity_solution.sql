use activity_dataset;

-- number 1
select agent_name, phone_number 
from agents;

-- number 2
select cust_name 
from customer
where working_area = "leeds";

-- number 3
select order_num, order_amount
from orders
where order_description = "shoe";

-- number 4

select agent_code,order_amount,order_description 
from orders
where order_amount = 3000 and order_description = "clothes";

-- number 5
select * 
from orders
where order_amount > 2000;

-- number 6
select cust_name, phone_number 
from customer
where cust_name like "%e%"
order by cust_name desc;

-- number 7
select * 
from orders
where order_amount = (select min(order_amount) from orders);

-- number 8
select sum(order_amount) 
from orders;

-- number 9
select count(distinct agent_code)
from orders;

-- number 10
select cust_code, max(order_amount) as HighestPurchaseAmount
from orders
group by cust_code
order by cust_code,HighestPurchaseAmount;

-- number 11 
select agent_code, max(order_amount)
from orders 
where order_date = "2022-07-13"
group by agent_code;

-- number 12 using implicit join
select c.cust_name, c.cust_city,a.agent_name
from customer c, agents a
where a.working_area = c.working_area;

-- number 12 using inner join (This is an alternative to Activity number 12)
select c.cust_name, c.cust_city,a.agent_name,a.working_area as Agent_working_areas ,c.working_area as customer_working_area
from customer c
inner join agents a on a.working_area = c.working_area;

-- number 13 
select cust_name, agent_name
from customer, agents
where customer.agent_code = agents.agent_code;

-- number 13 using Inner join
select c.cust_name,a.agent_name
from customer c
inner join agents a on a.agent_code = c.agent_code;

-- number 14 using the Implicit join system
select order_num, cust_name, orders.agent_code
from agents,customer,orders
where customer.working_area <> agents.working_area
and orders.cust_code = customer.cust_code
and orders.agent_code = agents.agent_code;

-- number 14 Using (the Explicit join) the relationship between tables are explicitly shown and easy to understand  
select o.order_num,c.cust_name,a.agent_code
from orders o
inner join customer c on c.cust_code = o.cust_code
inner join agents a on a.agent_code = c.agent_code
where a.working_area = c.working_area;

-- number 15 using implicit pattern 
select * from orders
where agent_code = (select agent_code from agents where agent_name = "Rickey");

-- number 15 using explicit pattern to show the relationship between the two tables 
select o.*, a.agent_name
from orders o
inner join agents a on a.agent_code = o.agent_code
where agent_name = "Rickey";

-- number 16 changing the agent name to KRIS
select * from orders
where agent_code = (select agent_code from agents where agent_name = "Kris");

-- number 16 changing the agent name to KRIS
select o.*, a.agent_name
from orders o
inner join agents a on a.agent_code = o.agent_code
where agent_name = "Kris";




