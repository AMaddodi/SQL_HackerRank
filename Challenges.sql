/*
  Number of challenges created by each hacker
*/
with tbl_num_challenges as(
  select     h.hacker_id, 
             h.name, 
             count(c.challenge_id) as cng_count
  from       hackers as h
  join       challenges as c on h.hacker_id = c.hacker_id
  group by   h.hacker_id, h.name
),

/*
  Count of total number of challenges 
*/
tbl_count_challenges as(
  select    cng_count, 
            count(cng_count) as cng_count_count
  from      tbl_num_challenges
  group by  cng_count
)

select      tnc.hacker_id,
            tnc.name,
            tnc.cng_count
from        tbl_num_challenges as tnc
join        tbl_count_challenges as tcc on tnc.cng_count = tcc.cng_count
where       tcc.cng_count_count =1 
            or
            tcc.cng_count = (select   max(cng_count) 
                             from     tbl_num_challenges) 
order by    tnc.cng_count desc, tnc.hacker_id;

