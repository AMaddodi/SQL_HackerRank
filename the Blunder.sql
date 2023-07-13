select 
       ceiling(avg(cast(salary as decimal(10,2))) -
       avg(cast(replace(salary, '0', '') as decimal(10,2))))
from employees;
