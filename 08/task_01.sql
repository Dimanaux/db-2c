CREATE TABLE "user" (
  id     SERIAL,
  name VARCHAR(20),
  email  VARCHAR(20),
  CONSTRAINT user_pk PRIMARY KEY (id)
);

CREATE TABLE user_log (
  id INTEGER,
  old_user_name VARCHAR(20),
  new_user_name  VARCHAR(20),
  old_email VARCHAR(20),
  new_email VARCHAR(20),
  "date" TIMESTAMP,
  op_type VARCHAR(6)
);

CREATE FUNCTION user_delete() RETURNS TRIGGER AS $user_delete$
  BEGIN
    INSERT INTO user_log (id, old_user_name, old_email, "date", op_type)
      VALUES (OLD.id, OLD.name, OLD.email, now(), TG_OP);
    RETURN NULL;
  END;
$user_delete$ LANGUAGE plpgsql;


CREATE FUNCTION user_insert() RETURNS TRIGGER AS $user_insert$
  BEGIN
    INSERT INTO user_log (id, new_user_name, new_email, "date", op_type)
      VALUES (NEW.id, NEW.name, NEW.email, now(), TG_OP);
    RETURN NULL;
  END;
$user_insert$ LANGUAGE plpgsql;

CREATE FUNCTION user_update() RETURNS TRIGGER AS $user_update$
  BEGIN
    INSERT INTO user_log (id, old_user_name, new_user_name, old_email, new_email, "date", op_type)
      VALUES (NEW.id, OLD.name, NEW.name, OLD.email, NEW.email, now(), TG_OP);
    RETURN NULL;
  END;
$user_update$ LANGUAGE plpgsql;


CREATE TRIGGER user_delete AFTER DELETE ON "user"
  FOR EACH ROW EXECUTE PROCEDURE user_delete();

CREATE TRIGGER user_insert AFTER INSERT ON "user"
  FOR EACH ROW EXECUTE PROCEDURE user_insert();

CREATE TRIGGER user_update AFTER UPDATE ON "user"
  FOR EACH ROW EXECUTE PROCEDURE user_update();

-- DROP TRIGGER user_update ON "user";

INSERT INTO "user" (name, email) VALUES ('dimka', 'pochta');

UPDATE "user" SET name = 'Dmitry' WHERE name = 'dimka';

DELETE FROM "user" WHERE name = 'Dmitry';

