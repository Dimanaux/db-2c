SELECT d.id AS dep_id, d.name AS dep_name, e.name AS emp_name
  FROM department d
  LEFT JOIN employee e
    ON e.department_id = d.id
  GROUP BY d.name, d.id, e.name ORDER BY d.id;

SELECT name FROM department d
WHERE (SELECT count(*) FROM employee WHERE department_id = d.id)
        <= 3;

SELECT d.name FROM department d INNER JOIN employee e
ON d.id = e.department_id
GROUP BY d.name
HAVING count(e.id) <= 3;
