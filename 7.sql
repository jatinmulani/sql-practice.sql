select@@autocommit;
-- create table as select
-- CTAS  
use ctedb;
create table ctedb.test100 as 
SELECT actor_id,first_name from sakila.actor where actor_id between 1 and 4;
select*from test100;
start transaction;
update test100 set first_name = 'aman15152' where  actor_id=3;
commit;
select*from test100;
rollback;
