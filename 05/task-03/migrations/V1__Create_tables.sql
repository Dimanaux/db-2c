CREATE TABLE hospital (
  id   SERIAL      NOT NULL,
  name VARCHAR(64) NOT NULL,
  CONSTRAINT hospital_pk PRIMARY KEY (id),
  CONSTRAINT unique_hospital_name UNIQUE (name)
);

CREATE TABLE area (
  id   SERIAL      NOT NULL,
  name VARCHAR(16) NOT NULL,
  CONSTRAINT area_pk PRIMARY KEY (id),
  CONSTRAINT unique_area_name UNIQUE (name)
);

CREATE TABLE doctor (
  id          SERIAL      NOT NULL,
  name        VARCHAR(20) NOT NULL,
  area_id     INT         NOT NULL,
  hospital_id INT         NOT NULL,
  CONSTRAINT doctor_pk PRIMARY KEY (id),
  CONSTRAINT doctor_area_fk FOREIGN KEY (area_id) REFERENCES area (id),
  CONSTRAINT doctor_hospital_fk FOREIGN KEY (hospital_id) REFERENCES hospital (id)
);

CREATE TABLE ambulance_duty (
  id        SERIAL    NOT NULL,
  doctor_id INTEGER   NOT NULL,
  time_from TIMESTAMP NOT NULL,
  time_to   TIMESTAMP NOT NULL DEFAULT now(),
  CONSTRAINT ambulance_duty_pk PRIMARY KEY (id),
  CONSTRAINT ambulance_duty_valid_interval CHECK (
    time_from < time_to
  ),
  CONSTRAINT ambulance_duty_doctor_id_fk FOREIGN KEY (doctor_id) REFERENCES doctor (id)
);
