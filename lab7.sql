CREATE DATABASE lab7;

CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO countries (name) VALUES
    ('Kazakhstan'), ('Russia'), ('USA'), ('Canada'), ('Germany');

-- Create 'employees' table and populate it with sample data
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    department_id INT
);

INSERT INTO employees (name, surname, salary, department_id) VALUES
    ('John', 'Doe', 50000.00, 1),
    ('Jane', 'Smith', 60000.00, 2),
    ('Emily', 'Johnson', 70000.00, 3),
    ('Chris', 'Evans', 45000.00, 1),
    ('Anna', 'Taylor', 80000.00, 2);

-- Create 'departments' table and populate it with sample data
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    budget DECIMAL(10, 2) NOT NULL
);

INSERT INTO departments (department_name, budget) VALUES
    ('HR', 100000.00),
    ('Engineering', 200000.00),
    ('Marketing', 150000.00);


CREATE INDEX idx_countries_name
    ON countries (name);
-- SELECT * FROM countries
--          WHERE name = 'string';

CREATE INDEX idx_employees_name_surname
    ON employees (name, surname);
-- SELECT * FROM employees
--          WHERE name = 'string'
--            AND surname = 'string';

CREATE UNIQUE INDEX idx_employees_salary_range
    ON employees (salary);
-- SELECT * FROM employees
--          WHERE salary < value1
--            AND salary > value2;

CREATE INDEX idx_employees_name_substring
    ON employees ((substring(name FROM 1 FOR 4)));
-- SELECT * FROM employees
--          WHERE substring(name from 1 for 4) = 'abcd';

CREATE INDEX idx_employees_departments_id_salary
    ON employees (department_id, salary);
CREATE INDEX idx_departments_id_budget
    ON departments (department_id, budget);
-- SELECT * FROM employees e
--     JOIN departments d
--         ON d.department_id = e.department_id
--          WHERE d.budget > value2
--            AND e.salary < value2;


