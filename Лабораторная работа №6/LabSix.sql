-- task 1
-- C:\oracle19c\admin\orcl\pfile\init.ora.314202314043


-- task 2
-- File is exists in my OS


-- task 3 -- C:\oracle19c\setup\database\VDA_PFILE.ORA
CREATE PFILE = 'VDA_PFILE.ORA' FROM spfile; -- run AS sysdba
SELECT * FROM V$PARAMETER;


-- task 4 -- .open_cursors=310


-- task 5
CREATE spfile = 'SPFILEORCL1.ORA' FROM pfile = 'VDA_PFILE.ORA'; --run AS sysdba
SELECT * FROM "V$PARAMETER" WHERE name = 'open_cursors';


-- task 6
SELECT * FROM "V$PARAMETER" WHERE name = 'open_cursors';


-- task 7
-- In this case, you must startup with an init.ora file in which you only specify the spfile parameter full name:
-- spfile=d:\ora901\database\spfiletest.ora
-- startup mount pfile = 'pfile_path';


-- task 8
SELECT * FROM "V$CONTROLFILE";


-- task 9
ALTER DATABASE backup controlfile TO trace;


-- task 10
-- PWDORACLE_SID.ora -- ORACLE_HOME\database;


-- task 11
-- C:\oracle19c\setup\database\PWDorcl.ora


-- task 12
SELECT * FROM v$DIAG_INFO;


-- task 13 -- C:\oracle19c\diag\rdbms\orcl\orcl\alert\log.xml
ALTER system switch logfile;
SELECT * FROM V$LOG;


-- task 14
-- C:\oracle19c\diag\rdbms\orcl\orcl\trace







