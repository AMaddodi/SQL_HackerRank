declare @i int

set @i = 1

while @i <= 20
    begin
        select replicate('* ', @i)
        set @i = @i+1
    end;
