
col id format 99
col t1 format a35
col dump_t1 format a70
col tz_type format a10

set linesize 200 trimspool on

alter session set nls_timestamp_format = 'yyyy-mm-dd hh24.mi.ssxff';
alter session set nls_timestamp_tz_format = 'yyyy-mm-dd hh24.mi.ssxff tzr';

with data as (
select id, c1 t1, 'NONE' tz_type from timestamp_tz_test
union all
select id, c2 t1, 'TZ' tz_type from timestamp_tz_test
union all
select id, c2 t1, 'LTZ' tz_type from timestamp_tz_test
)
select id, t1, tz_type, dump(t1) dump_t1
from data
where id=1
order by id, tz_type
/

