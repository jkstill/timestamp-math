
-- extract examples

def nls_tf='yyyy-mm-dd hh24.mi.ssxff'

alter session set nls_timestamp_format = '&nls_tf';

col d1_day format 999999
col full_interval format a30
col year_month_interval format a10

with dates as (
	select 
		to_timestamp_tz('2014-06-19 14:24:29.373872', '&nls_tf') d1 
		, to_timestamp_tz('2016-03-31 09:42:16.8734921', '&nls_tf') d2
	from dual
)
select 
	extract(day from d1) d1_day
	, ( d2 - d1) day(4) to second full_interval
	, ( d2 - d1) year(3) to month year_month_interval
	, extract( day from d2 - d1) days_diff
	, extract( hour from d2 - d1) hours_diff
	, extract( minute from d2 - d1) minutes_diff
	, extract( second from d2 - d1) seconds_diff
from dates
/


