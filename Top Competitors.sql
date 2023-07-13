select     s.hacker_id , h.name
from       Submissions as s
left join  Hackers as h     on h.hacker_id = s.hacker_id
inner join Challenges as c  on c.challenge_id = s.challenge_id
inner join Difficulty as d  on d.difficulty_level = c.difficulty_level
where      s.score = d.score
group by   s.hacker_id, h.name
having     count(s.hacker_id) >1
order by   count(s.hacker_id) desc, s.hacker_id;
