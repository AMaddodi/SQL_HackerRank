declare @const_hackers table
( hacker_id int,
  submission_date date);
  
declare @unique_hacker table
( hacker_count int,
  submission_date date
);
  
declare @right_date date;
declare @left_date date;

insert into @const_hackers
select      hacker_id,
            submission_date
from        submissions
where       submission_date like '2016-03-01';

set @right_date = '2016-03-01';
set @left_date  = '2016-03-01';

while @right_date < '2016-03-15'
    begin
        set @right_date = dateadd(day,1,@right_date);
        insert into @const_hackers
        select      s.hacker_id,
                    s.submission_date
        from        submissions s
        join        @const_hackers h on s.hacker_id = h.hacker_id and h.submission_date like @left_date
        where s.submission_date like @right_date
        set @left_date = dateadd(day,1,@left_date);
    end;
    
insert into @unique_hacker
select      count(distinct hacker_id),
            submission_date
from        @const_hackers
group by    submission_date;

with max_hacker as(
  select 
              row_number() over (partition by submission_date order by count(s.hacker_id) desc, s.hacker_id asc) as row_num,
              s.hacker_id,
              submission_date,
              name
  from        submissions as s
  join        hackers as h
    on s.hacker_id = h.hacker_id
  group by    s.hacker_id, submission_date, name)

select 
            s.submission_date,
            uh.hacker_count,
            mh.hacker_id,
            mh.name
from        submissions as s
join        max_hacker as mh on mh.submission_date = s.submission_date and row_num = 1
join        @unique_hacker as uh on uh.submission_date = s.submission_date
group by    s.submission_date , mh.hacker_id, mh.name, uh.hacker_count
order by    s.submission_date;
