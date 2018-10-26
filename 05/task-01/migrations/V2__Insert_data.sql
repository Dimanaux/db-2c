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
       ('Russell Grant', 5, 4);

INSERT INTO ambulance_duty (doctor_id, time_from, time_to)
VALUES (3, '2016-06-22', '2018-11-03'),
       (8, '2017-03-02', '2018-10-31'),
       (2, '2008-02-25', '2018-10-26'),
       (3, '2018-11-03', '2018-11-04'),
       (1, '2018-11-14', '2018-12-04'),
       (3, '2018-12-13', '2018-12-15'),
       (2, '2018-12-22', '2018-12-28'),
       (1, '2018-10-25', '2018-10-26'),
       (1, '2018-11-23', '2018-11-27'),
       (7, '2018-11-29', '2018-12-05'),
       (5, '2018-11-04', '2018-11-06'),
       (8, '2018-11-19', '2018-11-21'),
       (7, '2018-11-27', '2018-11-29'),
       (2, '2018-12-05', '2018-12-07'),
       (9, '2018-11-22', '2018-11-25'),
       (4, '2018-12-12', '2018-12-20'),
       (3, '2018-12-05', '2018-12-10');

