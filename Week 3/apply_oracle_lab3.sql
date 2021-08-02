-- ------------------------------------------------------------------
--  Program Name:   apply_oracle_lab3.sql
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
--   sql> @apply_oracle_lab3.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Cleanup prior installations and run previous lab scripts.
-- ------------------------------------------------------------------
@/home/student/Data/cit225/oracle/lab2/apply_oracle_lab2.sql

-- Open log file.
SPOOL apply_oracle_lab3.txt

-- Enter code below.
-- ------------------------------------------------------------------
-- Step #1
-- ------------------------------------------------------------------
COL total_rows 	FORMAT 999 HEADING "Total|Rows"

SELECT
  COUNT(*) AS total_rows
FROM member;

-- ------------------------------------------------------------------
-- Step #2
-- ------------------------------------------------------------------
COL last_name 	FORMAT A12 HEADING "Last Name"
COL total_names FORMAT 999 HEADING "Total|Names"

SELECT
  last_name
, COUNT(*) AS total_names
FROM contact
GROUP BY last_name
ORDER BY total_names ASC;

-- ------------------------------------------------------------------
-- Step #3
-- ------------------------------------------------------------------
COL item_rating FORMAT A12 HEADING "Item|Rating"
COL total_count FORMAT 999 HEADING "Total|Count"

SELECT
  item_rating
, COUNT(*) AS total_count
FROM item
WHERE item_rating IN ('G', 'PG', 'NR')
GROUP BY item_rating
ORDER BY item_rating ASC;

-- ------------------------------------------------------------------
-- Step #4
-- ------------------------------------------------------------------
COL account_number 		FORMAT A10 HEADING "Account|Number"
COL credit_card_number 	FORMAT A19 HEADING "Credit|Card|Number"
COL last_name 			FORMAT A12 HEADING "Last Name"
COL total_count 		FORMAT 999 HEADING "Total|Count"

SELECT
  last_name
, account_number
, credit_card_number
, COUNT(*) AS total_count
FROM member m
  JOIN contact c
    ON m.member_id = c.member_id
GROUP BY last_name, account_number, credit_card_number
HAVING COUNT(*) > 1
ORDER BY total_count DESC;

-- ------------------------------------------------------------------
-- Step #5
-- ------------------------------------------------------------------
SET PAGESIZE 99
COL last_name 			FORMAT A12 HEADING "Last Name"
COL city 				FORMAT A12 HEADING "City"
COL state_province 		FORMAT A8 HEADING "State|Province"

SELECT
  DISTINCT 
  last_name
, city
, state_province
FROM contact c 
  JOIN address a
    ON c.contact_id = a.contact_id
ORDER BY last_name ASC;

-- ------------------------------------------------------------------
-- Step #6
-- ------------------------------------------------------------------
COL last_name FORMAT A12 HEADING "Last Name"
COL telephone FORMAT A14 HEADING "Telephone"

SELECT
  DISTINCT 
  last_name
, '('||area_code||') '||telephone_number AS telephone
FROM contact c 
  JOIN telephone t
    ON c.contact_id = t.contact_id
ORDER BY last_name ASC;

-- ------------------------------------------------------------------
-- Step #7
-- ------------------------------------------------------------------
COL common_lookup_id 		FORMAT 9999 HEADING "Common|Lookup ID"
COL common_lookup_context 	FORMAT A30 	HEADING "Common|Lookup Context"
COL common_lookup_type 		FORMAT A16 	HEADING "Common|Lookup Type"
COL common_lookup_meaning 	FORMAT A16 	HEADING "Common|Lookup Meaning"

SELECT
  common_lookup_id
, common_lookup_context
, common_lookup_type
, common_lookup_meaning
FROM common_lookup
WHERE common_lookup_type IN ('BLU-RAY', 'DVD_FULL_SCREEN', 'DVD_WIDE_SCREEN')
ORDER BY common_lookup_type ASC;

-- ------------------------------------------------------------------
-- Step #8
-- ------------------------------------------------------------------
COL item_title 	FORMAT A28 	HEADING "Item Title"
COL item_rating FORMAT A6 	HEADING "Item|Rating"

SELECT
  item_title
, item_rating
FROM item i 
  JOIN rental_item r
    ON i.item_id = r.item_id
WHERE item_type IN 
(
SELECT
  common_lookup_id
FROM common_lookup
WHERE common_lookup_type IN ('BLU-RAY', 'DVD_FULL_SCREEN', 'DVD_WIDE_SCREEN')
)
ORDER BY item_title ASC;

-- ------------------------------------------------------------------
-- Step #9
-- ------------------------------------------------------------------
COL common_lookup_id 		FORMAT 9999 HEADING "Common|Lookup ID"
COL common_lookup_context 	FORMAT A30 	HEADING "Common|Lookup Context"
COL common_lookup_type 		FORMAT A16 	HEADING "Common|Lookup Type"
COL common_lookup_meaning 	FORMAT A16 	HEADING "Common|Lookup Meaning"
COL card_total 				FORMAT 999 	HEADING "Card|Total"

SELECT
  common_lookup_id
, common_lookup_context
, common_lookup_type
, common_lookup_meaning
, COUNT(credit_card_type) AS card_total
FROM member m
  JOIN common_lookup c
    ON m.credit_card_type = c.common_lookup_id
WHERE common_lookup_type IN ('DISCOVER_CARD', 'MASTER_CARD', 'VISA_CARD')
GROUP BY common_lookup_id, common_lookup_context, common_lookup_type, common_lookup_meaning
ORDER BY common_lookup_meaning ASC;

-- ------------------------------------------------------------------
-- Step #10
-- ------------------------------------------------------------------
COL common_lookup_id 		FORMAT 9999 HEADING "Common|Lookup ID"
COL common_lookup_context 	FORMAT A30 	HEADING "Common|Lookup Context"
COL common_lookup_type 		FORMAT A16 	HEADING "Common|Lookup Type"
COL common_lookup_meaning 	FORMAT A16 	HEADING "Common|Lookup Meaning"
COL card_total 				FORMAT 999 	HEADING "Card|Total"

SELECT
  common_lookup_id
, common_lookup_context
, common_lookup_type
, common_lookup_meaning
, COUNT(credit_card_type) AS card_total
FROM member m
  RIGHT OUTER JOIN common_lookup c
    ON m.credit_card_type = c.common_lookup_id
WHERE common_lookup_type IN ('DISCOVER_CARD', 'MASTER_CARD', 'VISA_CARD')
GROUP BY common_lookup_id, common_lookup_context, common_lookup_type, common_lookup_meaning
HAVING COUNT(credit_card_type) = 0;

-- ------------------------------------------------------------------
-- Enter lab code above.

-- Close log file.
SPOOL OFF
