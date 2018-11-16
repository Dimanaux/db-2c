CREATE TABLE products (
  id SERIAL,
  name VARCHAR(20),
  price INTEGER,
  CONSTRAINT products_pk PRIMARY KEY (id)
);

CREATE TABLE sales (
  id SERIAL,
  product_id INTEGER,
  new_price INTEGER,
  date TIMESTAMP DEFAULT now(),
  CONSTRAINT sales_pk PRIMARY KEY (id),
  CONSTRAINT products_fk FOREIGN KEY (product_id) REFERENCES products (id)
);

CREATE OR REPLACE FUNCTION create_sales() RETURNS TRIGGER AS $create_sales$
  DECLARE
    old_price INTEGER;
    new_price INTEGER;
  BEGIN
    SELECT price INTO old_price FROM products WHERE id = NEW.product_id;
    new_price = NEW.new_price;

    IF (old_price < new_price) THEN
      RAISE EXCEPTION 'New price must be less than old!';
    END IF;
    RETURN NEW;
  END;
$create_sales$ LANGUAGE plpgsql;

CREATE TRIGGER create_sales BEFORE INSERT OR UPDATE ON sales
  FOR EACH ROW EXECUTE PROCEDURE create_sales();

INSERT INTO products (name, price)
  VALUES ('Apple', 43);

INSERT INTO sales (product_id, new_price)
  VALUES (1, 42);
-- OK


INSERT INTO products (name, price)
  VALUES ('Orange', 60);

INSERT INTO sales (product_id, new_price)
  VALUES (2, 65);
-- EXCEPTION

