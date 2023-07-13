select 
            max(if(occupation = 'doctor', name, NULL)) as Doctor,
            max(if(occupation = 'professor', name, NULL)) as Professor,
            max(if(occupation = 'Singer', name, NULL)) as Singer,
            max(if(occupation = 'Actor', name, NULL)) as Actor
from        (select      name,
                        occupation,
                        row_number() over (partition by occupation order by name) as rn
            from        occupations) as t
group by rn;
