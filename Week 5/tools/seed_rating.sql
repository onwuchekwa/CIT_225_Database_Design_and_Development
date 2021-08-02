-- seed_rating.sql 

-- ==================================================================================
-- MPAA (Movies) Ratings
-- ==================================================================================
INSERT INTO rating
(rating_id, rating_agency_id, rating, description, created_by, creation_date,
last_updated_by, last_update_date)
VALUES
(rating_s1.NEXTVAL, (SELECT rating_agency_id FROM rating_agency WHERE
rating_agency_abbr = 'MPAA'), 'G', 'General Audiences', (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE, (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE);

INSERT INTO rating
(rating_id, rating_agency_id, rating, description, created_by, creation_date,
last_updated_by, last_update_date)
VALUES
(rating_s1.NEXTVAL, (SELECT rating_agency_id FROM rating_agency WHERE
rating_agency_abbr = 'MPAA'), 'PG', 'Parental Guidance Suggested', (SELECT
system_user_id FROM system_user WHERE system_user_name = 'DBA2'), SYSDATE, (SELECT
system_user_id FROM system_user WHERE system_user_name = 'DBA2'), SYSDATE);

INSERT INTO rating
(rating_id, rating_agency_id, rating, description, created_by, creation_date,
last_updated_by, last_update_date)
VALUES
(rating_s1.NEXTVAL, (SELECT rating_agency_id FROM rating_agency WHERE
rating_agency_abbr = 'MPAA'), 'PG-13', 'Parental Guidance Strongly Suggested',
(SELECT system_user_id FROM system_user WHERE system_user_name = 'DBA2'), SYSDATE,
(SELECT system_user_id FROM system_user WHERE system_user_name = 'DBA2'), SYSDATE);

INSERT INTO rating
(rating_id, rating_agency_id, rating, description, created_by, creation_date,
last_updated_by, last_update_date)
VALUES
(rating_s1.NEXTVAL, (SELECT rating_agency_id FROM rating_agency WHERE
rating_agency_abbr = 'MPAA'), 'NC-17', 'No One 17 And Under Admitted', (SELECT
system_user_id FROM system_user WHERE system_user_name = 'DBA2'), SYSDATE, (SELECT
system_user_id FROM system_user WHERE system_user_name = 'DBA2'), SYSDATE);

INSERT INTO rating
(rating_id, rating_agency_id, rating, description, created_by, creation_date,
last_updated_by, last_update_date)
VALUES
(rating_s1.NEXTVAL, (SELECT rating_agency_id FROM rating_agency WHERE
rating_agency_abbr = 'MPAA'), 'R', 'Restricted', (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE, (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE);

INSERT INTO rating
(rating_id, rating_agency_id, rating, description, created_by, creation_date,
last_updated_by, last_update_date)
VALUES
(rating_s1.NEXTVAL, (SELECT rating_agency_id FROM rating_agency WHERE
rating_agency_abbr = 'MPAA'), 'NR', 'Not Rated', (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE, (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE);

-- ==================================================================================
--ESRB RATINGS
-- ==============================================================================
INSERT INTO rating
(rating_id, rating_agency_id, rating, description, created_by, creation_date,
last_updated_by, last_update_date)
VALUES
(rating_s1.NEXTVAL, (SELECT rating_agency_id FROM rating_agency WHERE
rating_agency_abbr = 'ESRB'), 'EC', 'Early Childhood', (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE, (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE);

INSERT INTO rating
(rating_id, rating_agency_id, rating, description, created_by, creation_date,
last_updated_by, last_update_date)
VALUES
(rating_s1.NEXTVAL, (SELECT rating_agency_id FROM rating_agency WHERE
rating_agency_abbr = 'ESRB'), 'E', 'Everyone', (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE, (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE);

INSERT INTO rating
(rating_id, rating_agency_id, rating, description, created_by, creation_date,
last_updated_by, last_update_date)
VALUES
(rating_s1.NEXTVAL, (SELECT rating_agency_id FROM rating_agency WHERE
rating_agency_abbr = 'ESRB'), 'E10+', 'Everyone 10+', (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE, (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE);

INSERT INTO rating
(rating_id, rating_agency_id, rating, description, created_by, creation_date,
last_updated_by, last_update_date)
VALUES
(rating_s1.NEXTVAL, (SELECT rating_agency_id FROM rating_agency WHERE
rating_agency_abbr = 'ESRB'), 'T', 'Teen', (SELECT system_user_id FROM system_user
WHERE system_user_name = 'DBA2'), SYSDATE, (SELECT system_user_id FROM system_user
WHERE system_user_name = 'DBA2'), SYSDATE);

INSERT INTO rating
(rating_id, rating_agency_id, rating, description, created_by, creation_date,
last_updated_by, last_update_date)
VALUES
(rating_s1.NEXTVAL, (SELECT rating_agency_id FROM rating_agency WHERE
rating_agency_abbr = 'ESRB'), 'M', 'Mature', (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE, (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE);

INSERT INTO rating
(rating_id, rating_agency_id, rating, description, created_by, creation_date,
last_updated_by, last_update_date)
VALUES
(rating_s1.NEXTVAL, (SELECT rating_agency_id FROM rating_agency WHERE
rating_agency_abbr = 'ESRB'), 'AO', 'Adult Only', (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE, (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE);

INSERT INTO rating
(rating_id, rating_agency_id, rating, description, created_by, creation_date,
last_updated_by, last_update_date)
VALUES
(rating_s1.NEXTVAL, (SELECT rating_agency_id FROM rating_agency WHERE
rating_agency_abbr = 'ESRB'), 'RP', 'Rating Pending', (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE, (SELECT system_user_id FROM
system_user WHERE system_user_name = 'DBA2'), SYSDATE);
