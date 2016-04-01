

col dump_t1 format a70
col c1 format a35
col id format 99999999

select id, c1, substr(dump(c1),instr(dump(c1),',',-1,4)+1) dump_t1
from t2
order by id
/


