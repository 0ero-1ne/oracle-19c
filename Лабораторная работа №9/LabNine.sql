-- task 1
-- Done!


-- task 2
CREATE GLOBAL TEMPORARY TABLE VDA_TEMP
(
	record_id int PRIMARY KEY,
	record_name varchar2(10) NOT NULL
) ON COMMIT PRESERVE ROWS;

INSERT INTO VDA_TEMP VALUES (1, 'record');
INSERT INTO VDA_TEMP VALUES (2, 'record');
COMMIT;

SELECT * FROM VDA_TEMP;

-- task 3
CREATE SEQUENCE S1
	INCREMENT BY 10
	START WITH 1000
	NOMINVALUE
	NOMAXVALUE
	NOCYCLE
	NOCACHE
	NOORDER;

SELECT S1.NEXTVAL FROM DUAL;
SELECT S1.CURRVAL FROM DUAL;


-- task 4
CREATE SEQUENCE S2
	INCREMENT BY 10
	START WITH 10
	MAXVALUE 100
	NOCYCLE;
	
SELECT S2.NEXTVAL FROM DUAL;
SELECT S2.CURRVAL FROM DUAL;


-- task 5
CREATE SEQUENCE S3
	INCREMENT BY -10
	START WITH 10
	MINVALUE -100
	MAXVALUE 10
	NOCYCLE
	ORDER;
	
SELECT S3.NEXTVAL FROM DUAL;
SELECT S3.CURRVAL FROM DUAL;


-- task 6
CREATE SEQUENCE S4
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 10
	MINVALUE 1
	CYCLE
	CACHE 5
	NOORDER;

SELECT S4.NEXTVAL FROM DUAL;
SELECT S4.CURRVAL FROM DUAL;


-- task 7
SELECT * FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER = 'VDA';


-- task 8
CREATE TABLE T1
(
	N1 number(20),
	N2 number(20),
	N3 number(20),
	N4 number(20)
) cache storage(buffer_pool keep);

INSERT INTO T1 VALUES (S1.NEXTVAL, S2.NEXTVAL, S3.NEXTVAL, S4.NEXTVAL);
SELECT * FROM T1;


-- task 9
CREATE CLUSTER ABC
(
	X number(10),
	V varchar2(12)
) hashkeys 200;


-- task 10
CREATE TABLE A
(
	XA number(10),
	VA varchar2(12),
	DA varchar2(1)
) CLUSTER ABC(XA, VA);


-- task 11
CREATE TABLE B
(
	XB number(10),
	VB varchar2(12),
	DB varchar2(1)
) CLUSTER ABC(XB, VB);


-- task 12
CREATE TABLE C
(
	XC number(10),
	VC varchar2(12),
	DC varchar2(1)
) CLUSTER ABC(XC, VC);


-- task 13
SELECT * FROM ALL_TABLES WHERE OWNER = 'VDA';
SELECT * FROM ALL_CLUSTERS;


-- task 14
CREATE SYNONYM SYN_C FOR VDA.C;
SELECT * FROM SYN_C;


-- task 15
CREATE PUBLIC SYNONYM SYN_B FOR VDA.B;
SELECT * FROM SYN_B;


-- task 16
CREATE TABLE T2
(
	record_id int PRIMARY KEY,
	record_name varchar2(10)
)

CREATE TABLE T3
(
	record_id int PRIMARY KEY,
	record_age int,
	record_name int,
	CONSTRAINT FK_RECORDNAME
		FOREIGN KEY (record_name)
		REFERENCES T2 (record_id)
)

INSERT INTO T2 values(1, 'Dmitry');
INSERT INTO T2 values(2, 'Ivan');
INSERT INTO T2 values(3, 'Nikita');
INSERT INTO T2 values(4, 'Vladislav');
COMMIT;

INSERT INTO T3 values(1, 19, 1);
INSERT INTO T3 values(2, 18, 2);
INSERT INTO T3 values(3, 19, 3);
INSERT INTO T3 values(4, 20, 4);
COMMIT;

CREATE FORCE VIEW V1
AS
SELECT t2.record_name AS "Name",
	   t3.record_age AS "Age"
FROM T2 t2
JOIN T3 t3
ON t3.record_name = t2.record_id;

SELECT * FROM V1;


-- task 17
CREATE MATERIALIZED VIEW MV_VDA
	BUILD IMMEDIATE
	REFRESH COMPLETE
	ENABLE QUERY REWRITE
AS
SELECT t2.record_name AS "Name",
	   t3.record_age AS "Age"
FROM T2 t2
JOIN T3 t3
ON t3.record_name = t2.record_id;

ALTER MATERIALIZED VIEW MV_VDA
	REFRESH COMPLETE ON DEMAND
	NEXT SYSDATE + NUMTODSINTERVAL(2, 'MINUTE');

BEGIN
	DBMS_MVIEW.REFRESH('MV_VDA');
END;

SELECT * FROM MV_VDA;


-- task 18
CREATE DATABASE LINK orcl_db
	CONNECT TO SYSTEM
	IDENTIFIED BY "$Ad0129$"
	USING 'ORCL';


-- task 19
SELECT * FROM VDA_T1@orcl_db WHERE RECORD_ID <= 100;
INSERT INTO VDA_T1@orcl_db VALUES (10004, 'DMITRY from PDB');
SELECT * FROM VDA_T1@orcl_db WHERE RECORD_ID > 10000;


-- Danger zone
DROP SEQUENCE S1;
DROP SEQUENCE S2;
DROP SEQUENCE S3;
DROP SEQUENCE S4;

DROP VIEW V1;
DROP MATERIALIZED VIEW MV_VDA;
DROP DATABASE LINK orcl_pdb;

DROP TABLE T1;
DROP TABLE T2;
DROP TABLE T3;
DROP TABLE A;
DROP TABLE B;
DROP TABLE C;

DROP SYNONYM SYN_C;
DROP PUBLIC SYNONYM SYN_B;












