
col c1_dump format a55
col c1 format a30
set linesize 200 trimspool on
set pagesize 60

drop table timestamp_test purge;

create table timestamp_test  (
	c1 timestamp 
)
/

insert into timestamp_test values(systimestamp );
insert into timestamp_test values(systimestamp - 366);
commit;

select 
	c1, dump(c1) c1_dump
from timestamp_test;

