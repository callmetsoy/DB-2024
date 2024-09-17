-- 1. Create database called «lab1»
CREATE DATABASE lab1;

-- 2. Create table «users» with following fields
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);
--3. Add column isadmin
ALTER TABLE users ADD COLUMN isadmin INTEGER;
--4. Change type to boolean
ALTER TABLE users ALTER COLUMN isadmin TYPE BOOLEAN USING isadmin::boolean;
--5. Change value as false
ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;
--7. Create table tasks
CREATE TABLE tasks(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    user_id INTEGER REFERENCES users(id)

);
--8 drop table tasks
DROP TABLE tasks;
--9. drop database lab 1
DROP DATABASE lab1;

