-- dcl
use ctedb;
create table test101 as select actor_id,first_name from sakila.actor
where actor_id between 1 and 4;
select*from test101;
show grants for root@localhost;
-- to create user
create user tushar identified by 'tushar@123';
show grants for tushar; 
grant select on ctedb.test101 to tushar;
grant select on ctedb.* to tushar;
show grants for tushar;
grant insert,update on ctedb.test101 to tushar;
show grants for tushar;
create table kriti(age tinyint);
GRANT ALL PRIVILEGES ON ctedb.test101 TO tushar;
flush privileges;

show grants for tushar;


-- 1. create a role in mysql
create role manager;

 create user aadarsh identified by 'adarsh@123';
 create user namana identified by'naman@123';
 grant select on ctedb.* to aadarsh;
  grant select on ctedb.* to namana;
grant all privileges on  ctedb.* to aadarsh;
grant all privileges on ctedb.* to namana;
show grants;
