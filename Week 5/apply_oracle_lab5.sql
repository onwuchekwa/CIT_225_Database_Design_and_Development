-- ------------------------------------------------------------------
--  Program Name:   apply_oracle_lab5.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  17-Jan-2018
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ------------------------------------------------------------------
-- This creates tables, sequences, indexes, and constraints necessary
-- to begin lesson #5. Demonstrates proper process and syntax.
-- ------------------------------------------------------------------
-- Instructions:
-- ------------------------------------------------------------------
-- The two scripts contain spooling commands, which is why there
-- isn't a spooling command in this script. When you run this file
-- you first connect to the Oracle database with this syntax:
--
--   sqlplus student/student@xe
--
-- Then, you call this script with the following syntax:
--
--   sql> @apply_oracle_lab5.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Cleanup prior installations and run previous lab scripts.
-- ------------------------------------------------------------------
@/home/student/Data/cit225/oracle/lab4/apply_oracle_lab4.sql

-- Open log file.
SPOOL apply_oracle_lab5.txt

-- Enter code below.
-- ------------------------------------------------------------------
-- Step #1
-- ------------------------------------------------------------------
COL system_user_id FORMAT 9999 HEADING "System|User|ID #"

SELECT
  system_user_id
FROM system_user
WHERE system_user_name = 'DBA1';

-- ------------------------------------------------------------------
-- Step #2
-- ------------------------------------------------------------------
COL system_user_id   FORMAT 9999 HEADING "System|User|ID #"
COL system_user_name FORMAT A20  HEADING "System|User|Name"

SELECT 
  system_user_id
, system_user_name
FROM system_user
WHERE system_user_name = 'DBA1';

-- ------------------------------------------------------------------
-- Step #3
-- ------------------------------------------------------------------
COL system_user_id1   FORMAT 9999 HEADING "System User|ID #"
COL system_user_name1 FORMAT A12  HEADING "System User|Name"
COL system_user_id2   FORMAT 9999 HEADING "Created By|System User|ID #"
COL system_user_name2 FORMAT A12  HEADING "Created By|System User|Name"

SELECT
  su1.system_user_id AS system_user_id1
, su1.system_user_name AS system_user_name1
, su2.system_user_id AS system_user_id2
, su2.system_user_name AS system_user_name2
FROM system_user su1
  JOIN system_user su2
    ON su1.created_by = su2.system_user_id
WHERE su1.system_user_name = 'DBA1';

-- ------------------------------------------------------------------
-- Step #4
-- ------------------------------------------------------------------
COL system_user_id1   FORMAT 9999 HEADING "System User|ID #"
COL system_user_name1 FORMAT A12  HEADING "System User|Name"
COL system_user_id2   FORMAT 9999 HEADING "Created By|System User|ID #"
COL system_user_name2 FORMAT A12  HEADING "Created By|System User|Name"
COL system_user_id3   FORMAT 9999 HEADING "Last|Updated By|System User|ID #"
COL system_user_name3 FORMAT A12  HEADING "Last|Updated By|System User|Name"

SELECT
  su1.system_user_id AS system_user_id1
, su1.system_user_name AS system_user_name1
, su2.system_user_id AS system_user_id2
, su2.system_user_name AS system_user_name2
, su3.system_user_id AS system_user_id3
, su3.system_user_name AS system_user_name3
FROM system_user su1
  JOIN system_user su2
    ON su1.created_by = su2.system_user_id
  JOIN system_user su3
    ON su1.last_updated_by = su3.system_user_id
WHERE su1.system_user_name = 'DBA1';

-- ------------------------------------------------------------------
-- Step #5
-- ------------------------------------------------------------------
COL system_user_id1   FORMAT 9999 HEADING "System User|ID #"
COL system_user_name1 FORMAT A12  HEADING "System User|Name"
COL system_user_id2   FORMAT 9999 HEADING "Created By|System User|ID #"
COL system_user_name2 FORMAT A12  HEADING "Created By|System User|Name"
COL system_user_id3   FORMAT 9999 HEADING "Last|Updated By|System User|ID #"
COL system_user_name3 FORMAT A12  HEADING "Last|Updated By|System User|Name"

SELECT
  su1.system_user_id AS system_user_id1
, su1.system_user_name AS system_user_name1
, su2.system_user_id AS system_user_id2
, su2.system_user_name AS system_user_name2
, su3.system_user_id AS system_user_id3
, su3.system_user_name AS system_user_name3
FROM system_user su1
  JOIN system_user su2
    ON su1.created_by = su2.system_user_id
  JOIN system_user su3
    ON su1.last_updated_by = su3.system_user_id;

-- ------------------------------------------------------------------
-- Step #6
-- ------------------------------------------------------------------
@tools/drop_rating_agency.sql

CREATE TABLE rating_agency
(
  rating_agency_id   NUMBER
, rating_agency_abbr VARCHAR2(4)  CONSTRAINT nn_rating_agency_1 NOT NULL
, rating_agency_name VARCHAR2(40) CONSTRAINT nn_rating_agency_2 NOT NULL
, created_by               NUMBER CONSTRAINT nn_rating_agency_3 NOT NULL
, creation_date            DATE   CONSTRAINT nn_rating_agency_4 NOT NULL
, last_updated_by          NUMBER CONSTRAINT nn_rating_agency_5 NOT NULL
, last_update_date         DATE   CONSTRAINT nn_rating_agency_6 NOT NULL
, CONSTRAINT pk_rating_agency   PRIMARY KEY (rating_agency_id)
, CONSTRAINT uq_rating_agency   UNIQUE (rating_agency_abbr)
, CONSTRAINT fk_rating_agency_1 FOREIGN KEY (created_by)      REFERENCES system_user(system_user_id)
, CONSTRAINT fk_rating_agency_2 FOREIGN KEY (last_updated_by) REFERENCES system_user(system_user_id)
);

DROP SEQUENCE rating_agency_s1;

CREATE SEQUENCE rating_agency_s1
START WITH      1001
INCREMENT BY    1;

@tools/verify_rating_agency.sql

-- ------------------------------------------------------------------
-- Step #7
-- ------------------------------------------------------------------
INSERT INTO rating_agency
( rating_agency_id
, rating_agency_abbr
, rating_agency_name
, created_by
, creation_date
, last_updated_by
, last_update_date)
VALUES
( rating_agency_s1.NEXTVAL
, 'ESRB', 'Entertainment Software Rating Board'
, (SELECT system_user_id FROM system_user WHERE system_user_name = 'DBA2')
, SYSDATE
, (SELECT system_user_id FROM system_user WHERE system_user_name = 'DBA2')
, SYSDATE);

INSERT INTO rating_agency
( rating_agency_id
, rating_agency_abbr
, rating_agency_name
, created_by
, creation_date
, last_updated_by
, last_update_date)
VALUES
( rating_agency_s1.NEXTVAL
, 'MPAA'
, 'Motion Picture Association of America'
, (SELECT system_user_id FROM system_user WHERE system_user_name = 'DBA2')
, SYSDATE
, (SELECT system_user_id FROM system_user WHERE system_user_name = 'DBA2')
, SYSDATE);

COL rating_agency_id   FORMAT 9999 HEADING "Rating|Agency|ID #"
COL rating_agency_abbr FORMAT A6   HEADING "Rating|Agency|Abbr"
COL rating_agency_name FORMAT A40  HEADING "Rating Agency"

SELECT 
  rating_agency_id
, rating_agency_abbr
, rating_agency_name
FROM rating_agency;
  
-- ------------------------------------------------------------------
-- Step #8
-- ------------------------------------------------------------------
@tools/drop_rating.sql

CREATE TABLE rating
(
  rating_id        NUMBER 
, rating_agency_id       NUMBER  CONSTRAINT nn_rating_1 NOT NULL
, rating           VARCHAR2(15)  CONSTRAINT nn_rating_2 NOT NULL
, description      VARCHAR2(420) CONSTRAINT nn_rating_3 NOT NULL
, created_by              NUMBER CONSTRAINT nn_rating_4 NOT NULL
, creation_date             DATE CONSTRAINT nn_rating_5 NOT NULL
, last_updated_by         NUMBER CONSTRAINT nn_rating_6 NOT NULL
, last_update_date   VARCHAR(45) CONSTRAINT nn_rating_7 NOT NULL
, CONSTRAINT pk_rating   PRIMARY KEY (rating_id)
, CONSTRAINT uq_rating   UNIQUE (rating)
, CONSTRAINT fk_rating_1 FOREIGN KEY (created_by)       REFERENCES system_user(system_user_id)
, CONSTRAINT fk_rating_2 FOREIGN KEY (last_updated_by)  REFERENCES system_user(system_user_id)
, CONSTRAINT fk_rating_3 FOREIGN KEY (rating_agency_id) REFERENCES rating_agency(rating_agency_id)
);

DROP SEQUENCE rating_s1;

CREATE SEQUENCE rating_s1
START WITH      1001
INCREMENT BY    1;

@tools/verify_rating.sql
@tools/seed_rating.sql

UPDATE item SET item_rating = 'E'     where item_rating = 'Everyone';
UPDATE item SET item_rating = 'T'     where item_rating = 'Teen';
UPDATE item SET item_rating = 'M'     where item_rating = 'Mature';
UPDATE item SET item_rating = 'PG-13' where item_rating = 'PG13';

-- ------------------------------------------------------------------
-- Step #9
-- ------------------------------------------------------------------
ALTER TABLE item 
ADD rating_id NUMBER
CONSTRAINT fk_item_4 REFERENCES rating(rating_id);

UPDATE item i
SET i.rating_id =
( 
SELECT 
  r.rating_id
FROM rating r
WHERE r.rating = i.item_rating 
);

COL fk      FORMAT 9999 HEADING "Item|------||Foreign|Key #"
COL irating FORMAT A15  HEADING "Item|----------||Non-unique|Rating"
COL counter FORMAT 9999 HEADING "Item|----------|Count|Non-unique|Rating"
COL pk      FORMAT 9999 HEADING "Rating|------||Primary|Key #"
COL pk_abbr FORMAT A6   HEADING "Rating|Agency|------||Unique|Agency"
COL rating  FORMAT A15  HEADING "Rating|------||Unique|Rating"

SELECT
  i.rating_id AS fk
, i.item_rating AS irating
, COUNT(i.item_rating) AS counter
, r.rating_id AS pk
, ra.rating_agency_abbr AS pk_abbr
, r.rating AS rating
FROM item i
  JOIN rating r
    ON i.rating_id = r.rating_id
  JOIN rating_agency ra
    ON r.rating_agency_id = ra.rating_agency_id
GROUP BY i.rating_id, i.item_rating, r.rating_id, ra.rating_agency_abbr, r.rating
ORDER BY i.rating_id;

ALTER TABLE item
ADD CONSTRAINT nn_item_12 CHECK(rating_id IS NOT NULL);

ALTER TABLE item 
DROP COLUMN item_rating;

-- ------------------------------------------------------------------
-- Step #10
-- ------------------------------------------------------------------
COL account_number     FORMAT A10 HEADING "Account|Number"
COL last_name          FORMAT A10 HEADING "Last Name"
COL item_title         FORMAT A24 HEADING "Item Title"
COL rating_agency_abbr FORMAT A6  HEADING "Rating|Agency|Abbr"
COL rating             FORMAT A10 HEADING "Rating"

SELECT
  m.account_number
, c.last_name
, i.item_title
, ra.rating_agency_abbr
, r.rating
FROM member m
 JOIN contact c
   ON m.member_id = c.member_id
 JOIN rental re
   ON c.contact_id = re.customer_id
 JOIN rental_item ri
   ON re.rental_id = ri.rental_id
 JOIN item i
   ON ri.item_id = i.item_id
 JOIN rating r
   ON i.rating_id = r.rating_id
 JOIN rating_agency ra
   ON r.rating_agency_id = ra.rating_agency_id;

-- ------------------------------------------------------------------
-- Enter lab code above.

-- Close log file.
SPOOL OFF
