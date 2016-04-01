


col t1 format a35
col t2 format a38
col dump_t1 format a70
col dump_t2 format a70
col id format 99999

set linesize 250 trimspool on

/*
 using to_disinterval() allows performing timestamp math without implicit conversions

 see https://en.wikipedia.org/wiki/ISO_8601 
 for an explanation of the PTnS notation being used in to_dsinterval()

*/



alter session set nls_timestamp_format = 'yyyy-mm-dd hh24.mi.ssxff';
alter session set nls_timestamp_tz_format = 'yyyy-mm-dd hh24.mi.ssxff tzr';


-- subtract 60 second from the current date 

drop table t1 purge;
create table t1( id integer, c1 timestamp);

-- for value of 60 the last 4 components will always be the same
--define mult=60

-- for value of 60.1 the last of the 4 components will always be the same
--define mult=60.1

-- for value of 60.1 the last of the 4 components will always be the same
define mult=60.01



insert into t1
select 
	level,
	systimestamp + to_dsinterval('PT' || to_char(level*&mult) || 'S')
from dual connect by level <= 100
order by level 
/


commit;
