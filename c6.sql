
col c1 format a35
col c2 format a38
col c3 format a38
col id format 99

set linesize 250 trimspool on

alter session set nls_timestamp_format = 'yyyy-mm-dd hh24.mi.ssxff';
alter session set nls_timestamp_tz_format = 'yyyy-mm-dd hh24.mi.ssxff tzr';


select *
from timestamp_tz_test
order by id
/

