WITH department_salary AS (
  SELECT d.id, d.name, sum(e.salary) salary_sum
    FROM department d
    INNER JOIN employee e
      ON e.department_id = d.id
    GROUP BY d.id
)
SELECT * FROM department_salary
  WHERE salary_sum = (SELECT max(salary_sum) FROM department_salary);
