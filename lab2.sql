--1 Create database lab2
CREATE DATABASE lab2;
--2 Create table
CREATE TABLE countries(
    id SERIAL PRIMARY KEY,
    country_name VARCHAR,
    region_id INTEGER,
    population INTEGER
);
--3 Insert any data to a row
INSERT INTO countries (country_name, region_id, population)
VALUES ('South Korea', 82, 51700000);

--4 insert one row into the countries country id and name
INSERT INTO countries (id, country_name)
VALUES (DEFAULT, 'Japan');

--5 insert null values region id
INSERT INTO countries (country_name, region_id, population)
VALUES('Mexico', NULL, 127000000);

--6 Insert 3 rows in a single statement
INSERT INTO countries(country_name, region_id, population)
VALUES ('USA', 1, 333000000),
       ('France', 3, 97000000),
       ('Italy', 3, 59000000);
--7 set default value Kazakhstan to country_name
ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';
--8 insert default value to country name
INSERT INTO countries(region_id, population)
VALUES (7, 20000000);
--9
INSERT INTO countries DEFAULT VALUES;
--10
CREATE TABLE countries_new (LIKE countries INCLUDING ALL);
--11
INSERT INTO countries_new
SELECT * FROM countries;
--12
UPDATE countries
SET region_id = 1
WHERE region_id IS NULL;
--13
SELECT country_name, population * 1.10 AS "New Population"
FROM countries;
--14
DELETE FROM countries
WHERE population < 100000
RETURNING *;
--15
DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *;
--16
DELETE FROM countries
RETURNING *;
