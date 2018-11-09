SELECT e.id, e.name, e.salary, e.department_id
  FROM employee e
  INNER JOIN employee m
    ON e.manager_id = m.id
  WHERE e.department_id <> m.department_id;
