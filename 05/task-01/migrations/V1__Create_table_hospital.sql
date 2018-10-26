CREATE TABLE hospital (
    id   SERIAL      NOT NULL,
    name VARCHAR(64) NOT NULL,
    CONSTRAINT hospital_pk PRIMARY KEY (id),
    CONSTRAINT unique_hospital_name UNIQUE (name)
);

