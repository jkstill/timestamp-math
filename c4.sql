

col t1 format a35
col t2 format a38
col dump_t1 format a70
col dump_t2 format a70

set linesize 250 trimspool on

/*
 using to_disinterval() allows performing timestamp math without implicit conversions

 see https://en.wikipedia.org/wiki/ISO_8601 
 for an explanation of the PTnS notation being used in to_dsinterval()

*/

alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';


-- subtract 1 second from the current date
-- do it 10 times
select 
	--systimestamp t1,
	--dump(systimestamp) dump_t1,
	systimestamp - to_dsinterval('PT' || to_char(level) || 'S') t2,
	dump(systimestamp - to_dsinterval('PT' || to_char(level) || 'S')) dump_t2
from dual connect by level <= 10
order by level desc
/


