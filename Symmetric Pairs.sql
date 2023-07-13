with tbl_enum as (
  select 
            x,
            y,
            row_number() over (order by x,y) as row_num
  from functions)

select distinct
             t1.x,
             t1.y
from         tbl_enum as t1
join         tbl_enum as t2
    on t1.x = t2.y and
       t2.x = t1.y and
       t1.row_num != t2.row_num
where        t1.x <= t1.y
order by     t1.x;
