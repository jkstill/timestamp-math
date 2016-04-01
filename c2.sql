
col c1_dump format a70
col c1 format a35
col funcname format a15

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
	'timestamp' funcname, c1, dump(c1) c1_dump
from timestamp_test
union all
select 
	'systimestamp' funcname, systimestamp, dump(systimestamp) systimestamp_dump
from dual
/


