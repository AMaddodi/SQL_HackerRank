
select concat(name,'(',(SUBSTRING(occupation, 1, 1)),')')
from occupations
order by name;


select concat('There are a total of ',cast(count(occupation) as varchar(20)),' ', lower(occupation),'s.')
from occupations
group by occupation
order by count(occupation), occupation;
