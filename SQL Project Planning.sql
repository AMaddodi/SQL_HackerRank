with temp_start as (
  select   start_date,
           rank() over (order by start_date) as id
  from projects
  where start_date not in (select end_date from projects)
  ), 
  
temp_end as(
  select   end_date,
           rank() over (order by end_date) as id
  from     projects
  where     end_date not in (select start_date from projects))

select     start_date, 
           end_date
from       temp_start as ts 
join temp_end as te 
  on ts.id = te.id
order by datediff(day, start_date, end_date), start_date;
