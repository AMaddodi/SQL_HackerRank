declare @prime_tbl table(
    prime_num int
);

declare @new_num int;
declare @div_num int;
declare @flag int;

insert into @prime_tbl
values (2);

set @new_num = 3;

while @new_num <= 1000
    begin
        set @div_num = convert(int,(@new_num/2))
        set @flag = 0
        while @div_num >1
            begin
                if @new_num % @div_num = 0
                begin
                    set @flag = 1
                    break
                end;
                else
                    set @div_num = @div_num -1
            end;
        if @flag = 0
            insert into @prime_tbl values(@new_num)
        set @new_num = @new_num+1
    end;

select string_agg(prime_num,'&')
from @prime_tbl;
