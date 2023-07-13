select top 1
        months*salary,
        count(months*salary)
from    employee
group by months*salary
order by months*salary desc;
