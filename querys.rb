require_relative "connection"
require_relative "helpers"

DB = PG.connect(dbname: "booking")

def top_five_publishers
  result = DB.exec("SELECT * FROM publishers ORDER BY annual_revenue DESC LIMIT 5;")
  create_table("Top 5 Publishers", result.fields, result.values)
end

def search_books(data)
  key_search = data.keys.join == "title" ? "book.title" : "#{data.keys.join}.name"

  result = DB.exec("SELECT book.id, book.title, book.pages, author.name, publisher.name
                    FROM books AS book
                    INNER JOIN authors AS author ON book.author_id = author.id
                    INNER JOIN publishers AS publisher ON book.publisher_id = publisher.id
                    WHERE LOWER(#{key_search}) LIKE '%#{data.values.join.downcase}%'")
  create_table("Search Book", result.fields, result.values)
end

def count_books(data)
  key_search = data == "genre" ? "genre.genre" : "#{data}.name"
  result = DB.exec("SELECT #{key_search}, COUNT(DISTINCT(book.title)) AS count
                     FROM books AS book
                     INNER JOIN authors AS author ON book.author_id = author.id
                     INNER JOIN publishers AS publisher ON book.publisher_id = publisher.id
                     INNER JOIN books_genres AS book_genre ON book.id = book_genre.book_id
                     INNER JOIN genres AS genre ON book_genre.genre_id = genre.id
                     GROUP BY #{key_search}
                     ORDER BY count DESC;")

  create_table("Count Books", result.fields, result.values)
end

count_books('publisher')