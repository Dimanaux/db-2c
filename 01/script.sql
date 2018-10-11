CREATE TABLE student (
	name text,
	score int,
	group_number int
);

INSERT INTO student (name, score) VALUES ('Zulfiya', '2');
INSERT INTO student (name, score) VALUES ('Dima', '2');

SELECT * FROM student;

-- Add a new column 'last_name' to table 'student'
ALTER TABLE student
	ADD last_name text;

CREATE TABLE school (
	id SERIAL PRIMARY KEY,
	name text
);

INSERT INTO school (name) VALUES ('shkola #1');
INSERT INTO school (name) VALUES ('shkola #2');
INSERT INTO school (name) VALUES ('shkola #3');

UPDATE student
	SET last_name = 'Grebnev',
		score = 5
	WHERE name = 'Kolya';


-- Delete rows from table 'TableName'
DELETE FROM student
WHERE score < 10;