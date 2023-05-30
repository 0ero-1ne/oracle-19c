-- task 1
SELECT * FROM dba_tablespaces;

-- task 2
alter session set "_ORACLE_SCRIPT"=true;

create tablespace VDA_QDATA
    datafile 'D:\db\VDA_QDATA.dbf'
    size 10M
    autoextend on next 5M
    maxsize 30M
    extent management LOCAL
    OFFLINE;
    
CREATE USER	VDA IDENTIFIED BY 12345 -- vda123 is password
	DEFAULT TABLESPACE VDA_QDATA QUOTA UNLIMITED ON VDA_QDATA
	PROFILE PF_VDACORE
	ACCOUNT UNLOCK
	PASSWORD EXPIRE;
	
GRANT CREATE SESSION,
	  CREATE TABLE TO VDA;

ALTER USER VDA QUOTA 2M ON VDA_QDATA;

ALTER tablespace VDA_QDATA ONLINE;

CREATE TABLE VDA_T1
(
	record_id number(11) PRIMARY KEY,
	record_name varchar2(100)
);

INSERT INTO vda_t1 VALUES (1, 'Dmitry');
INSERT INTO vda_t1 VALUES (2, 'Ivan');
INSERT INTO vda_t1 VALUES (3, 'Andrey');
COMMIT;

SELECT * FROM vda_t1;

-- task 3
SELECT * FROM dba_segments WHERE tablespace_name = 'VDA_QDATA';

-- task 4
SELECT * FROM dba_segments WHERE segment_name = 'VDA_T1';

-- task 5
SELECT * FROM dba_segments WHERE segment_name <> 'VDA_T1' AND TABLESPACE_NAME = 'VDA_QDATA';

-- task 6
DROP TABLE VDA_T1;

-- task 7
SELECT * FROM dba_segments WHERE tablespace_name = 'VDA_QDATA';
SELECT * FROM dba_segments WHERE segment_name = 'VDA_T1';
SELECT * FROM RECYCLEBIN;
SELECT * FROM DBA_RECYCLEBIN;

-- task 8
FLASHBACK TABLE VDA_T1 TO BEFORE DROP;
SELECT * FROM VDA_T1;
COMMIT;

-- task 9
TRUNCATE TABLE VDA_T1;

DECLARE
	record_id number(11) := 1;
BEGIN
	WHILE (record_id <= 10000)
	LOOP	
		INSERT INTO vda_t1 VALUES (record_id, 'record');
		record_id := record_id + 1;
	END LOOP
	COMMIT;
END;

-- task 10
SELECT OWNER, EXTENTS, BLOCKS, BYTES
FROM dba_segments
WHERE segment_name = 'VDA_T1' AND owner = 'SYSTEM';

-- task 11
SELECT * FROM DBA_EXTENTS;

-- task 12
SELECT rowid, record_id, record_name FROM vda_t1 WHERE record_id < 100;

-- task 13
SELECT ora_rowscn, record_id, record_name FROM vda_t1 WHERE RECORD_ID < 10;

-- task 14
-- Для данного задания требуется создавать таблицу с параметром rowdependencies

-- task 15

-- task 16
DROP tablespace VDA_QDATA INCLUDING CONTENTS;




