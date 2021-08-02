-- Clean up previous work
@@/home/student/Data/cit225/oracle/lib1/utility/cleanup_oracle.sql

-- Create table, insert data model and application data
@@/home/student/Data/cit225/oracle/lib1/create/create_oracle_store2.sql
@@/home/student/Data/cit225/oracle/lib1/preseed/preseed_oracle_store.sql
@@/home/student/Data/cit225/oracle/lib1/seed/seeding.sql

-- Set session variables
SET ECHO ON
SET FEEDBACK ON
SET NULL '<Null>'
SET PAGESIZE 999
SET SERVEROUTPUT ON

-- Open a new log file to write output with a SQL*Plus commands
SPOOL apply_oracle_lab1.txt

-- Declare a session-level bind variable.
VARIABLE bind_variable VARCHAR2(30)

-- Assign a value to the session-level bind variable.
BEGIN
    :bind_variable := 'Lab 1 is complete!';
END;
/

-- Query the value of the session-level bind variable.
COLUMN bvariable FORMAT A30 HEADING "Session-level Bind Variable"
SELECT :bind_variable AS bvariable FROM dual;

-- The query to displays tables in the database
SELECT table_name
FROM user_tables
WHERE table_name NOT IN ('EMP','DEPT')
AND NOT table_name LIKE 'DEMO%'
AND NOT table_name LIKE 'APEX%'
ORDER BY table_name;

-- The script closes the log file with a SQL*Plus commands:
SPOOL OFF
