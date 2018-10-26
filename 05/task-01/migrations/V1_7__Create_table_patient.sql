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
