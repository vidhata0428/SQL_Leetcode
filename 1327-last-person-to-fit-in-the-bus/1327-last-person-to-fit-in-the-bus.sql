with cumm_cte as
(select 
turn,
person_id,
person_name,
weight,
sum(weight) over(order by turn) as turn_ser
from queue)

select top 1 person_name 
from cumm_cte
where turn_ser<=1000
order by turn_ser desc
