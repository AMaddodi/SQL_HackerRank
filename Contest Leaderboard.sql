with tbl_max_score as(
  select 
             max(score) as mx_score,
             challenge_id,
             hacker_id
  from       submissions
  group by   hacker_id,challenge_id
)

select
            h.hacker_id,
            h.name,
            sum(ms.mx_score)
from        hackers as h
inner join  tbl_max_score as ms
    on h.hacker_id = ms.hacker_id
group by    h.hacker_id, h.name
having      sum(ms.mx_score) > 0
order by    sum(ms.mx_score) desc, h.hacker_id;
