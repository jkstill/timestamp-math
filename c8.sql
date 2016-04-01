

col id format 99
col t1 format a35
col dumpdata format a50
col tz_type format a10
col ts_component format a40
col label format a6
col real_value format a50

set linesize 200 trimspool on

alter session set nls_timestamp_format = 'yyyy-mm-dd hh24.mi.ssxff';
alter session set nls_timestamp_tz_format = 'yyyy-mm-dd hh24.mi.ssxff tzr';


with rawdata as (
	select c2 t1, dump(c2) dump_t1
	from timestamp_tz_test
	where id = 1 
),
datedump as (
	select t1,
		substr(dump_t1,instr(dump_t1,' ',1,2)+1) dumpdata
	from rawdata
),
-- regex courtesy of http://nuijten.blogspot.com/2009/07/splitting-comma-delimited-string-regexp.html
datebits as (
	select level id, regexp_substr (dumpdata, '[^,]+', 1, rownum) ts_component
	from datedump
	connect by level <= length (regexp_replace (dumpdata, '[^,]+'))  + 1
),
labeldata as (
	select 'TS,DU,CC,YY,MM,DD,HH,MI,SS,P1,P2,P3,P4' rawlabel from dual
),
labels as (
	select level-2 id, regexp_substr (rawlabel, '[^,]+', 1, rownum) label
	from labeldata
	connect by level <= length (regexp_replace (rawlabel, '[^,]+'))  + 1
),
data as (
	select db.id, db.ts_component
	from datebits db
	union 
	select 0, dumpdata
	from datedump dd
	union select -1, to_char(t1) from rawdata
)
select d.id, l.label, d.ts_component,
	case l.label
	when 'DU' then d.ts_component
	when 'CC' then 'Excess 100 - Real Value: ' || to_char(to_number((d.ts_component - 100)*100 ))
	when 'YY' then 'Excess 100 - Real Value: ' || to_char(to_number(d.ts_component - 100 ))
	when 'MM' then 'Real Value: ' || d.ts_component
	when 'DD' then 'Real Value: ' || d.ts_component
	when 'HH' then 'Excess 1 - Real Value: ' || to_char(to_number(d.ts_component)-1)
	when 'MI' then 'Excess 1 - Real Value: ' || to_char(to_number(d.ts_component)-1)
	when 'SS' then 'Excess 1 - Real Value: ' || to_char(to_number(d.ts_component)-1)
	when 'P1' then 'Fractional Second P1 : ' || to_char((to_number(d.ts_component) * POWER(256,3) ) / power(10,9))
	when 'P2' then 'Fractional Second P2 : ' || to_char((to_number(d.ts_component) * POWER(256,2) ) / power(10,9))
	when 'P3' then 'Fractional Second P3 : ' || to_char((to_number(d.ts_component) * 256 ) / power(10,9))
	when 'P4' then 'Fractional Second P4 : ' || to_char((to_number(d.ts_component) + 256 ) / power(10,9))
	end real_value
from data d
join labels l on l.id = d.id
order by 1
/



