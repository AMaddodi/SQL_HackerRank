select 
            cast( (select max (lat_n) 
from        station 
where       lat_n in ( select top 50 percent lat_n from station order by lat_n )) as decimal (10,4));
