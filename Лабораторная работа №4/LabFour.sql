-- task 1
SELECT TABLESPACE_NAME, CONTENTS FROM dba_tablespaces;

-- task 2
SELECT FILE_NAME, TABLESPACE_NAME FROM dba_data_files;

-- task 3
SELECT * FROM V$LOG WHERE STATUS = 'CURRENT';
SELECT GROUP#, STATUS, MEMBERS FROM V$LOG;

-- task 4
SELECT * FROM V$LOGFILE;

-- task 5;
ALTER system switch logfile;
SELECT * FROM V$LOG;
ALTER system switch logfile;
SELECT * FROM V$LOG;
ALTER system switch logfile;
SELECT * FROM V$LOG;

-- task 6
ALTER DATABASE ADD logfile GROUP 4 'C:\ORACLE19C\ORADATA\ORCL\REDO04.LOG'
SIZE 50m BLOCKSIZE 512;

ALTER DATABASE ADD logfile MEMBER 'C:\ORACLE19C\ORADATA\ORCL\REDO041.LOG' TO GROUP 4;
ALTER DATABASE ADD logfile MEMBER 'C:\ORACLE19C\ORADATA\ORCL\REDO042.LOG' TO GROUP 4;
ALTER DATABASE ADD logfile MEMBER 'C:\ORACLE19C\ORADATA\ORCL\REDO043.LOG' TO GROUP 4;

ALTER system switch logfile;
SELECT * FROM V$LOG;
ALTER system switch logfile;
SELECT * FROM V$LOG;
ALTER system switch logfile;
SELECT * FROM V$LOG;
ALTER system switch logfile;
SELECT * FROM V$LOG;

-- task 7
ALTER DATABASE DROP logfile MEMBER 'C:\ORACLE19C\ORADATA\ORCL\REDO041.LOG';
ALTER DATABASE DROP logfile MEMBER 'C:\ORACLE19C\ORADATA\ORCL\REDO042.LOG';
ALTER DATABASE DROP logfile MEMBER 'C:\ORACLE19C\ORADATA\ORCL\REDO043.LOG';

ALTER DATABASE DROP logfile GROUP 4;

SELECT * FROM V$LOG;
SELECT * FROM V$LOGFILE;

-- task 8
SELECT log_mode FROM V$DATABASE;

-- task 9
SELECT max(DEST_ID) FROM V$ARCHIVE_DEST;
SELECT * FROM V$ARCHIVED_LOG;

-- task 10
SELECT log_mode FROM V$DATABASE;
SELECT * FROM V$LOG;
SELECT * FROM V$ARCHIVED_LOG;
SELECT INSTANCE_NAME, ARCHIVER, ACTIVE_STATE FROM V$INSTANCE;

-- task 11
ALTER system switch logfile;
SELECT * FROM V$ARCHIVED_LOG;
ALTER system switch logfile;
SELECT * FROM V$ARCHIVED_LOG;
ALTER system switch logfile;
SELECT * FROM V$ARCHIVED_LOG;
ALTER system switch logfile;
SELECT * FROM V$ARCHIVED_LOG;

-- task 12
SELECT name, log_mode FROM v$database;
SELECT instance_name, archiver, active_state FROM v$instance;

-- task 13
SHOW PARAMETER control; -- AS sysdba
SELECT * FROM V$CONTROLFILE;

-- task 14
SELECT TYPE, RECORD_SIZE, RECORDS_TOTAL FROM V$CONTROLFILE_RECORD_SECTION;

