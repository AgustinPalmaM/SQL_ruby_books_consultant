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

CREATE TABLE genres(
  id SERIAL PRIMARY KEY NOT NULL,
  genre VARCHAR NOT NULL
);

CREATE TABLE books(
  id SERIAL PRIMARY KEY NOT NULL,
  title VARCHAR NOT NULL,
  pages INT NOT NULL,
  author_id INT REFERENCES authors(id) NOT NULL,
  publisher_id INT REFERENCES publishers(id) NOT NULL
);

CREATE TABLE books_genres(
  id SERIAL PRIMARY KEY NOT NULL,
  genre_id INT REFERENCES genres(id) NOT NULL,
  book_id INT REFERENCES books(id) NOT NULL
);