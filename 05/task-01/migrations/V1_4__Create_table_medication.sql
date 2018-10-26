CREATE TABLE medication (
  id           SERIAL      NOT NULL,
  name         VARCHAR(40) NOT NULL,
  description  TEXT        NOT NULL,
  side_effects TEXT        NOT NULL,
  CONSTRAINT medication_pk PRIMARY KEY (id),
  CONSTRAINT unique_medication_name UNIQUE (name)
);
