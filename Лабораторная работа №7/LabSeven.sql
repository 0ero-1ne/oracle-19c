-- task 1
SELECT * FROM V$SGA;
SELECT sum(VALUE) FROM V$SGA;


-- task 2
SELECT DISTINCT POOL FROM V$SGASTAT;
SELECT * FROM "V$SGA_DYNAMIC_COMPONENTS";
SELECT SUM(BYTES) FROM V$SGASTAT WHERE POOL = 'shared pool';
SELECT SUM(BYTES) FROM V$SGASTAT WHERE POOL = 'large pool';


-- task 3
SELECT * FROM "V$SGA_DYNAMIC_COMPONENTS" WHERE current_size > 0;


-- task 4
SELECT * FROM V$SGASTAT WHERE name = 'free memory';


-- task 5
SELECT SUM(MIN_SIZE), SUM(MAX_SIZE) FROM "V$SGA_DYNAMIC_COMPONENTS";


-- task 6
SELECT * FROM V$SGA_DYNAMIC_COMPONENTS WHERE component LIKE '%cache%';


-- task 7
drop TABLE VDA; 

CREATE TABLE VDA
(
	k number(3)
) storage(buffer_pool default) tablespace users;

SELECT * FROM user_segments WHERE SEGMENT_NAME = 'VDA';


-- task 8
CREATE TABLE VDA1
(
	k number(3)
) cache storage(buffer_pool keep) tablespace users;

SELECT * FROM user_segments WHERE SEGMENT_NAME like '%VDA%';


-- task 9
show PARAMETER log_buffer; -- AS sysdba


-- task 10
SELECT * FROM V$SGASTAT WHERE pool = 'large pool' AND name = 'free memory';


-- task 11
SELECT * FROM V$SESSION WHERE server = 'DEDICATED' OR server = 'SHARED';


-- task 12
select sid,  process, program
from v$session s join v$bgprocess using (paddr)
where s.status = 'ACTIVE';


-- task 13
select program from v$process where background IS null;


-- task 14
SELECT * FROM v$process WHERE program LIKE '%(DBW%';


-- task 15


-- task 16
show PARAMETER dispatcher;


-- task 17
-- OracleOraDB19Home1TNSListener


-- task 18

-- task 20
