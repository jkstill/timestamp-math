
-- extract examples

def nls_tf='yyyy-mm-dd hh24.mi.ssxff'

alter session set nls_timestamp_format = '&nls_tf';

col d1 format a30
col d2 format a30
col full_interval format a30
col calc_date format a30

with dates as (
	select
		to_timestamp('2014-06-19 14:24:29.373872', '&nls_tf') d1
		, to_timestamp('2016-03-31 09:42:16.873492', '&nls_tf') d2
	from dual
)
select
	d1,d2
	, ( d2 - d1) day(4) to second  full_interval
	, d1 + ( d2 - d1) day(4) to second calc_date
from dates
/

