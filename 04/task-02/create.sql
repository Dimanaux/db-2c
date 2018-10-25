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
