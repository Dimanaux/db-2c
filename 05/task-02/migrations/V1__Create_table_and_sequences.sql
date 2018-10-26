CREATE TABLE IF NOT EXISTS sequences (
  sequence_1               INTEGER,
  sequence_10              INTEGER,
  sequence_from100_minus_5 INTEGER
);

CREATE SEQUENCE IF NOT EXISTS sequence_1
  AS INTEGER
  INCREMENT BY 1
  MINVALUE 0
  START 0
  OWNED BY sequences.sequence_1;

ALTER TABLE sequences
  ALTER COLUMN sequence_1 SET DEFAULT nextval('sequence_1');

CREATE SEQUENCE IF NOT EXISTS sequence_10
  AS INTEGER
  INCREMENT BY 10
  MINVALUE 0
  START 0
  OWNED BY sequences.sequence_10;

ALTER TABLE sequences
  ALTER COLUMN sequence_10 SET DEFAULT nextval('sequence_10');

CREATE SEQUENCE IF NOT EXISTS sequence_from100_minus_5
  AS INTEGER
  INCREMENT BY -5
  MAXVALUE 100
  START 100
  OWNED BY sequences.sequence_from100_minus_5;

ALTER TABLE sequences
  ALTER COLUMN sequence_from100_minus_5 SET DEFAULT nextval('sequence_from100_minus_5');