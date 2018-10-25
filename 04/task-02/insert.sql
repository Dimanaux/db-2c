
INSERT INTO area (name)
VALUES ('Allergy'),
       ('Abdominal'),
       ('Dermatology'),
       ('Emergency'),
       ('Family Medicine');

INSERT INTO hospital (name)
VALUES ('Student clinic #1'),
       ('Private clinic #2'),
       ('State hospital #3'),
       ('Private hospital #4');

INSERT INTO doctor (name, area_id, hospital_id)
VALUES ('Albert Einstein', 1, 3),
       ('Jerry Carlson', 3, 3),
       ('Alexander Walters', 4, 1),
       ('Juan Dixon', 1, 2),
       ('Nathan Wagner', 5, 4),
       ('Donald Johnson', 4, 3),
       ('Jose Wheeler', 2, 1),
       ('Bryan Schmidt', 3, 2),
       ('Russell Grant', 5,4);

