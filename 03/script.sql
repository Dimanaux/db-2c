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

CREATE TABLE disease (
  id          SERIAL      NOT NULL,
  name        VARCHAR(40) NOT NULL,
  description TEXT,
  CONSTRAINT disease_pk PRIMARY KEY (id),
  CONSTRAINT unique_disease_name UNIQUE (name)
);

CREATE TABLE medication (
  id           SERIAL      NOT NULL,
  name         VARCHAR(40) NOT NULL,
  description  TEXT        NOT NULL,
  side_effects TEXT        NOT NULL,
  CONSTRAINT medication_pk PRIMARY KEY (id),
  CONSTRAINT unique_medication_name UNIQUE (name)
);

CREATE TABLE treatment (
  id          SERIAL NOT NULL,
  desctiption TEXT   NOT NULL,
  CONSTRAINT treatment_pk PRIMARY KEY (id)
);

CREATE TABLE medication_to_treatment_relation (
  medication_id INTEGER NOT NULL,
  treatment_id  INTEGER NOT NULL,
  CONSTRAINT medication_to_treatment_relation_medication_fk FOREIGN KEY (medication_id) REFERENCES medication (id),
  CONSTRAINT medication_to_treatment_relation_treatment_fk FOREIGN KEY (treatment_id) REFERENCES treatment (id),
  CONSTRAINT unique_medication_treatment_pair UNIQUE (medication_id, treatment_id)
);

CREATE TABLE patient (
  id         SERIAL       NOT NULL,
  name       VARCHAR(40)  NOT NULL,
  birth_date TIMESTAMP(6) NOT NULL,
  is_male    BIT          NOT NULL,
  CONSTRAINT patient_pk PRIMARY KEY (id),
  CONSTRAINT birth_date_possible CHECK (
    age(birth_date) < INTERVAL '100' year
  )
);

CREATE TABLE ambulance_duty (
  id        SERIAL    NOT NULL,
  time_from TIMESTAMP NOT NULL,
  time_to   TIMESTAMP NOT NULL,
  CONSTRAINT ambulance_duty_pk PRIMARY KEY (id),
  CONSTRAINT ambulance_duty_valid_interval CHECK (
    time_from < time_to
  )
);

CREATE TABLE protocol (
  id           SERIAL    NOT NULL,
  patiend_id   INTEGER   NOT NULL,
  doctor_id    INTEGER   NOT NULL,
  time_from    TIMESTAMP NOT NULL,
  time_to      TIMESTAMP NOT NULL,
  record       TEXT      NOT NULL,
  disease_id    INTEGER,
  treatment_id INTEGER,
  CONSTRAINT protocol_pk PRIMARY KEY (id),
  CONSTRAINT protocol_valid_interval CHECK (
    time_from < time_to
  ),
  CONSTRAINT protocol_diagnosis FOREIGN KEY (disease_id) REFERENCES disease (id),
  CONSTRAINT protocol_treatment_fk FOREIGN KEY (treatment_id) REFERENCES treatment (id)
);
