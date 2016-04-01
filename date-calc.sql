
-- date calculation refresher

alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';

select sysdate today, sysdate -1 yesterday from dual;

select sysdate now, sysdate - (30/86400) "30_Seconds_Ago" from dual;

select sysdate now, sysdate + ( 1/24 ) + ( 15/1440 ) + ( 42/86400) "1:15:42_Later" from dual;


