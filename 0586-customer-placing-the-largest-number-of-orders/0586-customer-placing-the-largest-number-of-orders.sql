/* Write your T-SQL query statement below */
select customer_number 
from Orders 
group by customer_number 
having count(order_number) = (select max(order_num) from (select count(order_number) as order_num from Orders group by customer_number) as Order_nums)