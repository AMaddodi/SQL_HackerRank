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

/*
Using pivot table MS SQL
*/
select [Doctor], [Professor],[singer], [actor]
from        (select      name,
                        occupation,
                        row_number() over (partition by occupation order by name) as rn
            from        occupations) as t
pivot
( max(name) for occupation in ([Doctor],[Professor],[Singer],[Actor])
) as pvt
order by rn;

/*
Using case and temp table
*/
with temp_tbl as (
    select
        case
            when occupation ='Doctor' then name else NULL end as Doctor, 
        case
            when occupation = 'Professor' then name else NULL end as Professor,
        case
            when occupation = 'Singer' then name else NULL end as Singer,
        case    
            when occupation = 'Actor' then Name else NULL end as Actor,
        row_number() over (partition by occupation order by name) as rn
    from occupations
)

select 
            max(Doctor),
            max(Professor),
            max(Singer),
            max(Actor)
from        temp_tbl
group by    rn;
