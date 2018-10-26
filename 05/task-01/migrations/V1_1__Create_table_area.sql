CREATE TABLE area (
  id   SERIAL      NOT NULL,
  name VARCHAR(16) NOT NULL,
  CONSTRAINT area_pk PRIMARY KEY (id),
  CONSTRAINT unique_area_name UNIQUE (name)
);
