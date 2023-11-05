DROP TABLE IF EXISTS demo;
CREATE TABLE demo (
  id SERIAL PRIMARY KEY,
  name VARCHAR(500) NOT NULL
);
---
INSERT INTO demo
SELECT generate_series(1,1500), gen_random_uuid();
