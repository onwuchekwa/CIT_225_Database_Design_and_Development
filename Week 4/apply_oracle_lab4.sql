-- ------------------------------------------------------------------
--  Program Name:   apply_oracle_lab4.sql
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
-- to begin lesson #3. Demonstrates proper process and syntax.
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
--   sql> @apply_oracle_lab4.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Cleanup prior installations and run previous lab scripts.
-- ------------------------------------------------------------------
@/home/student/Data/cit225/oracle/lab3/apply_oracle_lab3.sql

-- Open log file.
SPOOL apply_oracle_lab4.txt

-- Enter code below.
-- ------------------------------------------------------------------
-- Step #1
-- ------------------------------------------------------------------
COL member_id FORMAT 9999 HEADING "Member|ID #"

SELECT
  DISTINCT
  m.member_id
FROM member m
  JOIN contact c
    ON m.member_id = c.member_id
WHERE LOWER(last_name) = 'sweeney';

-- ------------------------------------------------------------------
-- Step #2
-- ------------------------------------------------------------------
COL last_name FORMAT A10 HEADING "Last Name"
COL account_number FORMAT A10 HEADING "Account|Number"
COL credit_card_number FORMAT A19 HEADING "Credit Card Number"

SELECT
  last_name
, account_number
, credit_card_number
FROM member m
  JOIN contact c
    ON m.member_id = c.member_id
WHERE UPPER(last_name) = 'SWEENEY';

-- ------------------------------------------------------------------
-- Step #3
-- ------------------------------------------------------------------
COL last_name FORMAT A10 HEADING "Last Name"
COL account_number FORMAT A10 HEADING "Account|Number"
COL credit_card_number FORMAT A19 HEADING "Credit Card Number"

SELECT
  DISTINCT
  last_name
, account_number
, credit_card_number
FROM member m
  JOIN contact c
    ON m.member_id = c.member_id
WHERE UPPER(last_name) = 'SWEENEY';

-- ------------------------------------------------------------------
-- Step #4
-- ------------------------------------------------------------------
COL last_name FORMAT A10 HEADING "Last Name"
COL account_number FORMAT A10 HEADING "Account|Number"
COL credit_card_number FORMAT A19 HEADING "Credit Card Number"
COL address FORMAT A28 HEADING "Address"

SELECT
  DISTINCT
  last_name
, account_number
, credit_card_number
, city||', '||state_province||' '||postal_code AS address
FROM member m
  JOIN contact c
    ON m.member_id = c.member_id
  JOIN address a
    ON c.contact_id = a.contact_id
WHERE last_name = 'Vizquel';

-- ------------------------------------------------------------------
-- Step #5
-- ------------------------------------------------------------------
SET PAGESIZE 99
COL last_name FORMAT A12 HEADING "Last Name"
COL account_number FORMAT A10 HEADING "Account|Number"
COL credit_card_number FORMAT A19 HEADING "Credit Card Number"
COL address FORMAT A28 HEADING "Address"

SELECT
  DISTINCT
  last_name
, account_number
, credit_card_number
, street_address||CHR(10)||city||', '||state_province||' '||postal_code AS address
FROM member m
  JOIN contact c
    ON m.member_id = c.member_id
  JOIN address a
    ON c.contact_id = a.contact_id
  JOIN street_address s
    ON a.address_id = s.address_id
WHERE last_name = 'Vizquel';

-- ------------------------------------------------------------------
-- Step #6
-- ------------------------------------------------------------------
COL last_name FORMAT A12 HEADING "Last Name"
COL account_number FORMAT A10 HEADING "Account|Number"
COL address FORMAT A28 HEADING "Address"
COL telephone FORMAT A14 HEADING "Telephone"

SELECT
  DISTINCT
  last_name
, account_number
, street_address||CHR(10)||city||', '||state_province||' '||postal_code AS address
, '('||area_code||') '||telephone_number AS telephone
FROM member m
  JOIN contact c
    ON m.member_id = c.member_id
  JOIN address a
    ON c.contact_id = a.contact_id
  JOIN street_address s
    ON a.address_id = s.address_id
  JOIN telephone t
    ON c.contact_id = t.contact_id
WHERE last_name = 'Vizquel';
-- ------------------------------------------------------------------
-- Step #7
-- ------------------------------------------------------------------
COL last_name FORMAT A12 HEADING "Last Name"
COL account_number FORMAT A10 HEADING "Account|Number"
COL address FORMAT A28 HEADING "Address"
COL telephone FORMAT A14 HEADING "Telephone"

SELECT
  DISTINCT
  last_name
, account_number
, street_address||CHR(10)||city||', '||state_province||' '||postal_code AS address
, '('||area_code||') '||telephone_number AS telephone
FROM member m
  JOIN contact c
    ON m.member_id = c.member_id
  JOIN address a
    ON c.contact_id = a.contact_id
  JOIN street_address s
    ON a.address_id = s.address_id
  JOIN telephone t
    ON c.contact_id = t.contact_id;
	
-- ------------------------------------------------------------------
-- Step #8
-- ------------------------------------------------------------------
COL last_name FORMAT A12 HEADING "Last Name"
COL account_number FORMAT A10 HEADING "Account|Number"
COL address FORMAT A28 HEADING "Address"
COL telephone FORMAT A14 HEADING "Telephone"

SELECT
  DISTINCT
  last_name
, account_number
, street_address||CHR(10)||city||', '||state_province||' '||postal_code AS address
, '('||area_code||') '||telephone_number AS telephone
FROM member m
  JOIN contact c
    ON m.member_id = c.member_id
  JOIN address a
    ON c.contact_id = a.contact_id
  JOIN street_address s
    ON a.address_id = s.address_id
  JOIN telephone t
    ON c.contact_id = t.contact_id
  RIGHT JOIN rental r
    ON c.contact_id = r.customer_id
ORDER BY last_name ASC;
	
-- ------------------------------------------------------------------
-- Step #9
-- ------------------------------------------------------------------
COL last_name FORMAT A12 HEADING "Last Name"
COL account_number FORMAT A10 HEADING "Account|Number"
COL address FORMAT A28 HEADING "Address"
COL telephone FORMAT A14 HEADING "Telephone"

/*
SELECT
  last_name
, account_number
, address
, telephone
FROM 
(
SELECT
  last_name
, account_number
, street_address||CHR(10)||city||', '||state_province||' '||postal_code AS address
, '('||area_code||') '||telephone_number AS telephone
, COUNT(customer_id) AS customer_id
FROM member m
  JOIN contact c
    ON m.member_id = c.member_id
  JOIN address a
    ON c.contact_id = a.contact_id
  JOIN street_address s
    ON a.address_id = s.address_id
  JOIN telephone t
    ON c.contact_id = t.contact_id
  LEFT JOIN rental r
    ON c.contact_id = r.customer_id
GROUP BY last_name, account_number, street_address, city, state_province, postal_code, area_code, telephone_number
HAVING COUNT(r.customer_id) = 0
)
ORDER BY last_name ASC;
*/

SELECT
  last_name
, account_number
, street_address||CHR(10)||city||', '||state_province||' '||postal_code AS address
, '('||area_code||') '||telephone_number AS telephone
FROM member m
  JOIN contact c
    ON m.member_id = c.member_id
  JOIN address a
    ON c.contact_id = a.contact_id
  JOIN street_address s
    ON a.address_id = s.address_id
  JOIN telephone t
    ON c.contact_id = t.contact_id
  LEFT JOIN rental r
    ON c.contact_id = r.customer_id
GROUP BY last_name, account_number, street_address, city, state_province, postal_code, area_code, telephone_number
HAVING COUNT(r.customer_id) = 0
ORDER BY last_name ASC;
	
-- ------------------------------------------------------------------
-- Step #10
-- ------------------------------------------------------------------
COL full_name FORMAT A16 HEADING "Last Name"
COL account_number FORMAT A10 HEADING "Account|Number"
COL address FORMAT A25 HEADING "Address"
COL item_title FORMAT A14 HEADING "Item Title"

SELECT
  DISTINCT
  last_name||', '||first_name AS full_name
, account_number
, '('||area_code||') '||telephone_number||CHR(10)||street_address||CHR(10)||city||', '||state_province||' '||postal_code AS address
, item_title
FROM member m
  JOIN contact c
    ON m.member_id = c.member_id
  JOIN address a
    ON c.contact_id = a.contact_id
  JOIN street_address s
    ON a.address_id = s.address_id
  JOIN telephone t
    ON c.contact_id = t.contact_id
  RIGHT JOIN rental r
    ON c.contact_id = r.customer_id
  JOIN rental_item ri
    ON r.rental_id = ri.rental_id
  JOIN item i
    ON ri.item_id = i.item_id
WHERE item_title LIKE 'Stir Wars%'
  OR item_title LIKE 'Star Wars%'
ORDER BY item_title ASC;

-- ------------------------------------------------------------------
-- Enter lab code above.

-- Close log file.
SPOOL OFF
