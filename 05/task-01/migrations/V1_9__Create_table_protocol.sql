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
