select     sum(ct.population)
from       city as ct
inner join country as cr
    on ct.CountryCode = cr.Code
where      cr.CONTINENT = 'Asia';
