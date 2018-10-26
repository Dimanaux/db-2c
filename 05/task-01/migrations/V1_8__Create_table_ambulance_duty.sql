CREATE TABLE ambulance_duty (
  id        SERIAL    NOT NULL,
  doctor_id INTEGER   NOT NULL,
  time_from TIMESTAMP NOT NULL,
  time_to   TIMESTAMP NOT NULL,
  CONSTRAINT ambulance_duty_doctor_fk FOREIGN KEY (doctor_id) REFERENCES doctor (id),
  CONSTRAINT ambulance_duty_pk PRIMARY KEY (id),
  CONSTRAINT ambulance_duty_valid_interval CHECK (
    time_from < time_to
  )
);
