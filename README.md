<a name="readme-top"></a>

<br />
<div align="center">
  <h3 align="center">SQL Ruby book consultant</h3>

  <p align="center">
    This is a CLI App that let you to know more about a list of books with data lije authors, publishers, genres, using postgreSQL and ruby we can manage this app tho show relevant information to the user, as top fiove publishers, search by title, author or publisher and count of books using filters lije author, publisher or genres
    <br />
    <a href="https://github.com/AgustinPalmaM/SQL_ruby_books_consultant.git"><strong>Explore the docs »</strong></a>
  </p>
</div>

### Built With

* [![Ruby][Ruby]][Ruby-url]
* [![Postgres][Postgres]][Postgres-url]



# Workshop: SQL Booking

## Tasks

### Create an Entity Relationship Diagram (ERD)

Analyze the `CSV` file and build an ERD. Include an image of the ERD in the
project root.

### Create SQL statements to create the tables

Create the file `create.sql` with all the required statements to create the
tables of the ERD.

```bash
$ dropdb booking
$ createdb booking
$ psql -d booking < create.sql
CREATE TABLE
CREATE TABLE
CREATE TABLE
...
CREATE TABLE
$ 
```

### Populate the tables

Create a program `insert_data.rb` that should take one command-line argument
`csv_file_path`. The program should read the CSV file and create all the records
on the database.

### Booking app

The booking app displays a Menu with some options to interact with the database:

```bash
$ ruby booking.rb
Welcome to Booking
Write 'menu' at any moment to print the menu again and 'exit' to quit
---
1. Top 5 publisher by annual revenue
2. Search books by [title=string | author=string | publisher=string]
3. Count books by [author | publisher | genre]
---
>
```

Option 1 (no arguments)

```bash
> 1
+----+------------------------+----------------+--------------+
|              Top Publishers by Annual Revenue               |
+----+------------------------+----------------+--------------+
| id | name                   | annual_revenue | founded_year |
+----+------------------------+----------------+--------------+
| 7  | Ace Books              | 1910           | 1905         |
| 6  | City Lights Publishers | 1670           | 1898         |
| 4  | Palgrave Macmillan     | 1550           | 1930         |
| 10 | André Deutsch          | 1470           | 1863         |
| 9  | Berg Publishers        | 1400           | 1860         |
+----+------------------------+----------------+--------------+
>
```

Option 2 (the options could be title=string, author=string or publisher=string).
The search term should be case insensitive.

```bash
> 2 title=terrible
+----+----------------------+-------+---------------+-----------+
|                         Search Books                          |
+----+----------------------+-------+---------------+-----------+
| id | title                | pages | author        | publisher |
+----+----------------------+-------+---------------+-----------+
| 53 | Terrible Swift Sword | 904   | Brian Stanton | Ace Books |
+----+----------------------+-------+---------------+-----------+
>
```

```bash
> 2 publisher=lights
+----+------------------------------+-------+-------------------+------------------------+
|                                      Search Books                                      |
+----+------------------------------+-------+-------------------+------------------------+
| id | title                        | pages | author            | publisher              |
+----+------------------------------+-------+-------------------+------------------------+
| 8  | The Cricket on the Hearth    | 658   | Prof. Terry Wolff | City Lights Publishers |
| 11 | Everything is Illuminated    | 906   | Miss Joseph Feil  | City Lights Publishers |
| 19 | Fame Is the Spur             | 668   | Zonia Lebsack     | City Lights Publishers |
| 40 | Of Mice and Men              | 220   | Olivia Murray     | City Lights Publishers |
| 42 | I Will Fear No Evil          | 464   | Dessie Murazik    | City Lights Publishers |
| 49 | The Yellow Meads of Asphodel | 583   | Dr. Keven Schmitt | City Lights Publishers |
| 51 | Such, Such Were the Joys     | 973   | Madison Bernier   | City Lights Publishers |
| 68 | O Pioneers!                  | 927   | Josh Koelpin      | City Lights Publishers |
| 72 | Nectar in a Sieve            | 701   | Young Homenick    | City Lights Publishers |
| 94 | Dying of the Light           | 415   | Olivia Murray     | City Lights Publishers |
+----+------------------------------+-------+-------------------+------------------------+
>
```

```bash
> 2 author=dr
+----+--------------------------------------+-------+-------------------+------------------------+
|                                          Search Books                                          |
+----+--------------------------------------+-------+-------------------+------------------------+
| id | title                                | pages | author            | publisher              |
+----+--------------------------------------+-------+-------------------+------------------------+
| 2  | Antic Hay                            | 705   | Dr. Keven Schmitt | Matthias Media         |
| 14 | The Widening Gyre                    | 812   | Dr. Keven Schmitt | Brill                  |
| 26 | The Mirror Crack'd from Side to Side | 389   | Dr. Keven Schmitt | Manning Publications   |
| 37 | Time of our Darkness                 | 928   | Dr. Keven Schmitt | Brill                  |
| 49 | The Yellow Meads of Asphodel         | 583   | Dr. Keven Schmitt | City Lights Publishers |
| 97 | A Handful of Dust                    | 988   | Dr. Keven Schmitt | Palgrave Macmillan     |
+----+--------------------------------------+-------+-------------------+------------------------+
>
```

Option 3 (the option could be author, publisher, genre)

```bash
> 3 author
+-----------------------+-------------+
|             Count Books             |
+-----------------------+-------------+
| author                | count_books |
+-----------------------+-------------+
| Brian Stanton         | 10          |
| Daniel Klein          | 9           |
| Young Homenick        | 8           |
| Olivia Murray         | 8           |
| Dessie Murazik        | 7           |
| Zonia Lebsack         | 6           |
| Madison Bernier       | 6           |
| Dr. Keven Schmitt     | 6           |
| Belia Grady           | 5           |
| Josh Koelpin          | 5           |
| Prof. Terry Wolff     | 4           |
| Rev. Kathlene Rowe    | 4           |
| Brendan Heathcote     | 4           |
| Xavier Willms         | 4           |
| Lieselotte Bartoletti | 3           |
| Miss Joseph Feil      | 3           |
| Mr. Fermin Reichel    | 3           |
| Rodney Armstrong Ret. | 3           |
| Jared Miller          | 2           |
+-----------------------+-------------+
>
```

```bash
> 3 publisher
+------------------------+-------------+
|             Count Books              |
+------------------------+-------------+
| publisher              | count_books |
+------------------------+-------------+
| Palgrave Macmillan     | 13          |
| Matthias Media         | 13          |
| Blue Ribbon Books      | 13          |
| André Deutsch          | 12          |
| City Lights Publishers | 10          |
| Manning Publications   | 9           |
| Berg Publishers        | 8           |
| G. P. Putnam's Sons    | 8           |
| Brill                  | 7           |
| Ace Books              | 7           |
+------------------------+-------------+
>
```

```bash
> 3 genre
+---------------------+-------------+
|            Count Books            |
+---------------------+-------------+
| genre               | count_books |
+---------------------+-------------+
| Metafiction         | 27          |
| Historical fiction  | 25          |
| Reference book      | 23          |
| Fantasy             | 21          |
| Legend              | 21          |
| Speech              | 21          |
| Short story         | 20          |
| Science fiction     | 20          |
| Fiction in verse    | 17          |
| Comic/Graphic Novel | 11          |
+---------------------+-------------+
>
```

[Ruby]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white%22
[Ruby-url]: https://www.ruby-lang.org/en/ 
[Postgres]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[Postgres-url]: https://www.postgresql.org/