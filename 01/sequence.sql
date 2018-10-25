CREATE TABLE IF NOT EXISTS "user" (
  id INTEGER NOT NULL,
  name VARCHAR(20) NOT NULL
);


-- CREATE [ TEMPORARY | TEMP ] SEQUENCE [ IF NOT EXISTS ] имя [ INCREMENT [ BY ] шаг ]
--    [ MINVALUE мин_значение | NO MINVALUE ] [ MAXVALUE макс_значение | NO MAXVALUE ]
--    [ START [ WITH ] начало ] [ CACHE кеш ] [ [ NO ] CYCLE ]
--    [ OWNED BY { имя_таблицы.имя_столбца | NONE } ]

CREATE SEQUENCE IF NOT EXISTS user_serial AS BIGINT INCREMENT BY 1
  MINVALUE 0 NO MAXVALUE
  START 1 CACHE 1 NO CYCLE
  OWNED BY "user".id;

INSERT INTO "user" (id, name)
VALUES (nextval(user_serial), 'Denis'),
       (nextval(user_serial), 'Maria');

