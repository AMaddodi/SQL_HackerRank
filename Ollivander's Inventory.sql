select     id, age, coins_needed, power
from       (select 
                      min(w.coins_needed) over (partition by wp.age, w.power)as min_coins, 
                      w.id, 
                      wp.age, 
                      w.coins_needed, 
                      w.power
          from        wands as w
          left join   wands_property as wp on w.code = wp.code
          where       wp.is_evil = 0) as T1
where     min_coins = coins_needed
order by  power desc, age desc;
