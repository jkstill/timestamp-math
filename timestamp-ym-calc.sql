
-- timestamp - year-month calculations

col clater head 'LATER' format a38
col now format a35
col today format a35
col lastyear format a38
col nextyear format a38

alter session set nls_timestamp_format = 'yyyy-mm-dd hh24.mi.ssxff';
alter session set nls_timestamp_tz_format = 'yyyy-mm-dd hh24.mi.ssxff tzr';

-- alternate methods to add 1 year
select systimestamp today, systimestamp + to_yminterval('P1Y') nextyear from dual;
select systimestamp today, systimestamp + to_yminterval('01-00') nextyear from dual;


-- alternate methods to subtract 2 months 
select systimestamp now, systimestamp - to_yminterval('P2M') lastyear from dual;
select systimestamp now, systimestamp - to_yminterval('00-02') lastyear from dual;

-- alternate methods to add 2 year, 4 months, 6 days ,1 hour, 15 minutes and 42 seconds
select systimestamp now, systimestamp + to_yminterval('P2Y4M')  + to_dsinterval('P2DT1H15M42S') clater from dual;
select systimestamp now, systimestamp + to_yminterval('02-04')  + to_dsinterval('2 01:15:42') clater from dual;


