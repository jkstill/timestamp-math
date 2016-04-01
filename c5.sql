
drop table timestamp_tz_test purge;

create table timestamp_tz_test  (
	id integer,
	c1 timestamp,
	c2 timestamp with time zone,
	c3 timestamp with local time zone
)
/

-- create 10 rows each on second apart

--

begin
for i in 1..10
loop
	insert into timestamp_tz_test values(i,systimestamp,systimestamp,systimestamp );
	dbms_lock.sleep(1);
	null;
end loop;
commit;
end;
/


