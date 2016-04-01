
-- timestamp - incorrect calculation methods

alter session set nls_timestamp_format = 'yyyy-mm-dd hh24.mi.ssxff';
alter session set nls_date_format = 'DD-MON-YY';

select systimestamp today, systimestamp -1 yesterday from dual;

select systimestamp now, systimestamp - (30/86400) "30_Seconds_Ago" from dual;

select systimestamp now, systimestamp + ( 1/24 ) + ( 15/1440 ) + ( 42/86400) "1:15:42_Later" from dual;


