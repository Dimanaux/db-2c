CREATE TABLE medication_to_treatment_relation (
  medication_id INTEGER NOT NULL,
  treatment_id  INTEGER NOT NULL,
  CONSTRAINT medication_to_treatment_relation_medication_fk FOREIGN KEY (medication_id) REFERENCES medication (id),
  CONSTRAINT medication_to_treatment_relation_treatment_fk FOREIGN KEY (treatment_id) REFERENCES treatment (id),
  CONSTRAINT unique_medication_treatment_pair UNIQUE (medication_id, treatment_id)
);
