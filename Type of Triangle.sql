select 
    case
        when a=b and b=c and a=c then 'Equilateral'
        when ((a+b)<=c) or (a+c)<=b or (b+c)<=a then 'Not A Triangle'
        when (a=b and b!=c) or (b=c and a!=c) or (a=c and a!=b) then 'Isosceles'
        when (a!=b and b!=c) then 'Scalene'
       
    end
from triangles;
