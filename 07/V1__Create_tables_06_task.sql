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

INSERT INTO department (name)
VALUES ('Sales');

INSERT INTO employee (name, salary, department_id, manager_id)
  VALUES ('Finn the human', 117, 3, NULL);

INSERT INTO employee (name, salary, department_id, manager_id)
  VALUES ('John Mitchel', 69, 3, 6);

INSERT INTO employee (name, salary, department_id, manager_id)
  VALUES ('Valdis', 90, 3, NULL);

INSERT INTO employee (name, salary, department_id, manager_id)
  VALUES ('Ingvar Voitenko', 100000, 3, 4);

