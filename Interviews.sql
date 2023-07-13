with total_submit as (
  select      
              col.contest_id,
              sum(ss.total_submissions) as ts,
              sum(ss.total_accepted_submissions) as tas
  from        colleges as col
  inner join  challenges as cha on col.college_id = cha.college_id
  inner join  submission_stats as ss on ss.challenge_id = cha.challenge_id
  group by    col.contest_id
),
total_view as(  
  select      
              col.contest_id,
              sum(vs.total_views) as tv,
              sum(vs.total_unique_views) as tuv
  from        colleges as col
  inner join  challenges as cha on col.college_id = cha.college_id
  inner join  view_stats as vs on vs.challenge_id = cha.challenge_id
  group by    col.contest_id
)
  
select 
            con.contest_id,
            con.hacker_id,
            con.name,
            t_s.ts,
            t_s.tas,
            t_v.tv,
            t_v.tuv
from        contests as con
inner join  total_submit as t_s  on con.contest_id = t_s.contest_id
inner join  total_view as t_v    on con.contest_id = t_v.contest_id
where       t_s.ts > 0 or 
            t_s.tas > 0 or 
            t_v.tv > 0 or 
            t_v.tuv > 0
order by    con.contest_id;
