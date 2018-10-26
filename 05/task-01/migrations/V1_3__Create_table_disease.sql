CREATE TABLE disease (
  id          SERIAL      NOT NULL,
  name        VARCHAR(40) NOT NULL,
  description TEXT,
  CONSTRAINT disease_pk PRIMARY KEY (id),
  CONSTRAINT unique_disease_name UNIQUE (name)
);
