CREATE TABLE doctor (
  id          SERIAL      NOT NULL,
  name        VARCHAR(20) NOT NULL,
  area_id     INT         NOT NULL,
  hospital_id INT         NOT NULL,
  CONSTRAINT doctor_pk PRIMARY KEY (id),
  CONSTRAINT doctor_area_fk FOREIGN KEY (area_id) REFERENCES area (id),
  CONSTRAINT doctor_hospital_fk FOREIGN KEY (hospital_id) REFERENCES hospital (id)
);
