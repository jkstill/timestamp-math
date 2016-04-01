
-- timestamp - correct calculation methods


col c30 head '30_Seconds_Ago' format a38
col clater head '1:15:42_Later' format a38
col now format a35
col today format a35
col yesterday format a38

alter session set nls_timestamp_format = 'yyyy-mm-dd hh24.mi.ssxff';
alter session set nls_timestamp_tz_format = 'yyyy-mm-dd hh24.mi.ssxff tzr';


-- alternate methods to subtract 1 day
select systimestamp today, systimestamp - to_dsinterval('P1D') yesterday from dual;
select systimestamp today, systimestamp - to_dsinterval('1 00:00:00') yesterday from dual;

-- alternate methods to subtract 30 seconds
select systimestamp now, systimestamp - to_dsinterval('PT30S') c30 from dual;
select systimestamp now, systimestamp - to_dsinterval('0 00:00:30') c30 from dual;

-- alternate methods to add 1 hour, 15 minutes and 42 seconds
select systimestamp now, systimestamp + to_dsinterval('PT1H15M42S') clater from dual;
select systimestamp now, systimestamp + to_dsinterval('0 01:15:42') clater from dual;


