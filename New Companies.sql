/*
  Using only employee table
*/
select      distinct c.company_code,
            founder,
            t.lc,
            t.sc,
            t.mc,
            t.ec
from        company as c
inner join  (select      count(distinct lead_manager_code) as lc,
            count(distinct senior_manager_code) as sc,
            count(distinct manager_code) as mc,
            count(distinct employee_code) as ec,
            company_code
            from        employee
            group by    company_code) as t on t.company_code = c.company_code
order by company_code;

/*
  Using all tables
*/

select      distinct c.company_code,
            c.founder,
            count(distinct lm.lead_manager_code),
            count(distinct sm.senior_manager_code),
            count(distinct m.manager_code),
            count(distinct e.employee_code)
from        company as c
left join   lead_manager as lm on lm.company_code = c.company_code
left join   senior_manager as sm on sm.lead_manager_code = lm.lead_manager_code
left join   manager as m on m.senior_manager_code = sm.senior_manager_code
left join   employee as e on e.manager_code = m.manager_code
group by    c.company_code,
            c.founder
order by    c.company_code asc;
