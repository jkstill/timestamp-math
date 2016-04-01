

-- use of standard date math implicitly converts to date values

col t1 format a35
col t2 format a19
col dump_t1 format a70
col dump_t2 format a35

alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';

select 
	systimestamp t1,
	dump(systimestamp) dump_t1,
	systimestamp - (level / 86400) t2,
	dump(systimestamp - (level / 86400)) dump_t2
from dual connect by level <= 10
/


