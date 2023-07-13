select      name
from 
            (select      s.id ,
                        s.name,
                        p.salary as salary,
                        f.friend_id as friend_id,
                        (select salary from packages where id = f.friend_id) as friend_salary
            from        students as s
            join        friends as f on f.id = s.id
            join        packages as p on p.id = s.id) as s
where       friend_salary > salary
order by    friend_salary;
