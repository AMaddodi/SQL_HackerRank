/*
  Weather Observation Station 1
*/
select   CITY, STATE
from     STATION;

/*
  Weather Observation Station 2
*/
select   cast(sum(lat_n) as decimal(10,2)), 
         cast(sum(long_w) as decimal(10,2))
from     station;

/*
  Weather Observation Station 3
*/
select DISTINCT  
        CITY
from    STATION
where   ID%2 = 0;

/*
 Weather Observation Station 4
*/
select   count(CITY) - count(DISTINCT CITY)
from     STATION;

/*
   Weather Observation Station 6
*/
select distinct 
        city 
from    station
where   city like '[aeiou]%';

/*
  Weather Observation Station 7
*/
select distinct 
        city 
from    station
where   city like '%[aeiou]';

/*
  Weather Observation Station 8
*/
select distinct 
        city
from    station
where   city like '[aeiou]%[aeiou]';

/*
  Weather Observation Station 9
*/
select distinct 
        city
from    station
where   city not like '[aeiou]%';

/*
  Weather Observation Station 10
*/
select distinct 
        city
from    station
where   city not like '%[aeiou]';

/*
  Weather Observation Station 11
*/
select distinct 
        city
from    station
where   city not like '[aeiou]%[aeiou]';

/*
  Weather Observation Station 12
*/
select distinct 
        city
from    station
where   city not like '[aeiou]%[aeiou]' and city not like '[aeiou]%' and city not like '%[aeiou]';

/*
  Weather Observation Station 13
*/
select   cast(sum(lat_n) as decimal(10,4))
from     station
where    lat_n between 38.7880 and 137.2345;

/*
  Weather Observation Station 14
*/
select   cast((Max(lat_n)) AS decimal(9,4))
from     station
where    lat_n<137.2345;

/*
  Weather Observation Station 15
*/
select top 1 cast(long_w as decimal(10,4))
from     station
where    lat_n < 137.2345
order by lat_n desc;

/*
  Weather Observation Station 16
*/
select top 1 
          cast(lat_n as decimal(10,4))
from      station
where     lat_n > 38.7780
order by  lat_n;

/*
  Weather Observation Station 17
*/
select     round(long_w,4)
from       station
where      lat_n > 38.7780
order by   lat_n
limit      1;
