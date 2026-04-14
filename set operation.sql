-- set operation
use world;
select code , name,continent from country where continent='europe'
union 
select code ,name ,population from country where continent='asia';
select code ,name,continent from country where code in('alb','and')
except
select code,name,continent from country where code in('alb','bih');
select code ,name,continent from country where code in('alb','and')
intersect
select code,name,continent from country where code in('alb','bih');
-- recursive cte learning assignment 
