CREATE TABLE authors(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR NOT NULL,
  nationality VARCHAR NOT NULL,
  birthdate DATE NOT NULL
);

CREATE TABLE publishers(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR NOT NULL,
  annual_revenue INT NOT NULL,
  founded_year INT NOT NULL
);