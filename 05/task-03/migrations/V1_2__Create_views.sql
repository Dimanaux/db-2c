CREATE VIEW doctors_min_amb_duty_length_view AS
  SELECT duty.doctor_id, doc.name, min(duty.time_to - duty.time_from)
  FROM ambulance_duty duty
         INNER JOIN doctor doc on duty.doctor_id = doc.id
  GROUP BY doc.name, duty.doctor_id
  ORDER BY duty.doctor_id;

SELECT * FROM doctors_min_amb_duty_length_view;
--  doctor_id |       name        |  min
-- -----------+-------------------+--------
--          1 | Albert Einstein   | 1 day
--          2 | Jerry Carlson     | 2 days
--          3 | Alexander Walters | 1 day
--          4 | Juan Dixon        | 8 days
--          5 | Nathan Wagner     | 2 days
--          7 | Jose Wheeler      | 2 days
--          8 | Bryan Schmidt     | 2 days
--          9 | Russell Grant     | 3 days
-- (8 rows)


CREATE VIEW doctors_amb_duty_view AS
  SELECT duty.doctor_id, doc.name, duty.time_to, duty.time_from
  FROM ambulance_duty duty
         INNER JOIN doctor doc on duty.doctor_id = doc.id
  GROUP BY doc.name, duty.doctor_id, duty.time_to, duty.time_from
  ORDER BY duty.doctor_id;

SELECT name, avg(time_to - time_from) AS t
FROM doctors_amb_duty_view
GROUP BY name
ORDER BY t;
--        name        |         t
-- -------------------+--------------------
--  Nathan Wagner     | 2 days
--  Russell Grant     | 3 days
--  Jose Wheeler      | 4 days
--  Juan Dixon        | 8 days
--  Albert Einstein   | 8 days 08:00:00
--  Alexander Walters | 218 days
--  Bryan Schmidt     | 305 days
--  Jerry Carlson     | 1301 days 08:00:00
-- (8 rows)


CREATE VIEW doctors_by_hospital_amb_duty_view AS
  SELECT duty.doctor_id, doc.name, h.id, duty.time_to, duty.time_from
  FROM ambulance_duty duty
         INNER JOIN doctor doc on duty.doctor_id = doc.id
  INNER JOIN hospital h on doc.hospital_id = h.id
  GROUP BY doc.name, h.id, duty.doctor_id, duty.time_to, duty.time_from
  ORDER BY duty.doctor_id;


SELECT name AS d_name, id AS hosp, avg(time_to - time_from) AS avg_t
FROM doctors_by_hospital_amb_duty_view
GROUP BY name, id
ORDER BY avg_t;
--       d_name       | hosp |       avg_t
-- -------------------+------+--------------------
--  Nathan Wagner     |    4 | 2 days
--  Russell Grant     |    4 | 3 days
--  Jose Wheeler      |    1 | 4 days
--  Juan Dixon        |    2 | 8 days
--  Albert Einstein   |    3 | 8 days 08:00:00
--  Alexander Walters |    1 | 218 days
--  Bryan Schmidt     |    2 | 305 days
--  Jerry Carlson     |    3 | 1301 days 08:00:00
-- (8 rows)

