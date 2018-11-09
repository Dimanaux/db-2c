CREATE TABLE department (
  id SERIAL NOT NULL,
  name VARCHAR(30) NOT NULL,

  CONSTRAINT department_pk PRIMARY KEY (id)
);

CREATE TABLE employee (
  id SERIAL NOT NULL,
  name VARCHAR(20),
  salary INTEGER,
  department_id INTEGER,
  manager_id INTEGER,

  CONSTRAINT employee_pk PRIMARY KEY (id),
  CONSTRAINT department_id FOREIGN KEY (department_id) REFERENCES department (id),
  CONSTRAINT manager FOREIGN KEY (manager_id) REFERENCES employee (id)
);

INSERT INTO department (name)
  VALUES ('IT'),
        ('PR');

INSERT INTO employee (name, salary, department_id)
  VALUES ('John Smith', 100, 1);

INSERT INTO employee (name, salary, department_id, manager_id)
  VALUES ('Albert Einstein', 75, 1, 1);

INSERT INTO employee (name, salary, department_id)
  VALUES ('Harry Potter', 80, 2);

INSERT INTO employee (name, salary, department_id, manager_id)
  VALUES ('Darth Vader', 60, 2, 3); 

-- task 01
SELECT DISTINCT d.id, d.name, AVG(e.salary) AS avg_salary
  FROM department d
    INNER JOIN employee e
    ON d.id = e.department_id
  GROUP BY d.id
  HAVING AVG(e.salary) > 70;

-- CREATE VIEW department_average_salary AS  
--   SELECT DISTINCT d.id, d.name, AVG(e.salary) AS avg_salary
--     FROM department d
--       INNER JOIN employee e
--       ON d.id = e.department_id
--     GROUP BY d.id;


WITH max_avg_salary AS (
  SELECT MAX(avg_salary) FROM (
    SELECT d.id, d.name, AVG(e.salary) AS avg_salary
      FROM department d
        INNER JOIN employee e
        ON d.id = e.department_id
      GROUP BY d.id
    ) AS department_average_salary
  )
SELECT * FROM department_average_salary
  WHERE avg_salary = (SELECT max(max) FROM max_avg_salary);


-- task 02
SELECT * FROM department_average_salary
  WHERE
    avg_salary = (SELECT MAX(avg_salary) FROM (
      SELECT DISTINCT d.id, d.name, AVG(e.salary) AS avg_salary
        FROM department d
          INNER JOIN employee e
          ON d.id = e.department_id
        GROUP BY d.id
      ) AS department_average_salary);

SELECT * FROM department_average_salary
  ORDER BY avg_salary DESC LIMIT 1;


-- task 03
INSERT INTO employee (name, salary, department_id, manager_id)
  VALUES ('Maxim Pichkalev', 120, 1, 1);

SELECT e.id, e.name, e.salary, m.salary AS manager_salary
  FROM employee e
    INNER JOIN employee m ON e.manager_id = m.id
  WHERE e.salary > m.salary;

SELECT * FROM employee e
WHERE e.salary = (
  SELECT MAX(salary)
    FROM employee
    WHERE department_id = e.department_id
);
