declare @num int;

set @num = 20

while @num >0
    begin
        select replicate('* ', @num)
        set @num = @num-1
    end;
