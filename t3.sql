
-- create a table with timestamps 1 microsend appart

drop table t2 purge;
-- fractional seconds are in 1E-9 
-- eg. select 1E-9 from dual

create table t2 as
select level id,
	to_timestamp('2016-03-29 14:25:42.5' || lpad(to_char(level),8,'0'),'yyyy-mm-dd hh24.mi.ssxff') c1 
from dual
connect by level <= 1000
/
