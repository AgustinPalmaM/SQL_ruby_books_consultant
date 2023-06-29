require_relative "connection"
require "csv"

module FillDatabase
  DB = Connection.connect_db
  def insert_data(column, keys, values)
    DB.exec("INSERT INTO #{column}(#{keys.join(',')}) VALUES(#{values.join(',')}) RETURNING *;").first
  rescue StandardError
    DB.exec("SELECT * FROM #{column} WHERE #{keys.first} = #{values.first}").first
  end

  def fill_db
    CSV.foreach("books.csv", headers: true) do |row|
      row.fields.map { |item| item.gsub!("'", "''") }

      values = ["'#{row['author_name']}'", "'#{row['author_nationality']}'", "'#{row['author_birthdate']}'"]
      keys = ["name", "nationality", "birthdate"]
      author = insert_data("authors", keys, values)

      values = ["'#{row['publisher_name']}'", "'#{row['publisher_annual_revenue']}'",
                "'#{row['publisher_founded_year']}'"]
      keys = ["name", "annual_revenue", "founded_year"]
      publisher = insert_data("publishers", keys, values)

      values = ["'#{row['genre']}'"]
      keys = ["genre"]
      genre = insert_data("genres", keys, values)

      values = ["'#{row['title']}'", row["pages"], author["id"], publisher["id"]]
      keys = ["title", "pages", "author_id", "publisher_id"]
      book = insert_data("books", keys, values)

      values = [genre["id"], book["id"]]
      keys = ["genre_id", "book_id"]
      insert_data("books_genres", keys, values)
    end
  end
end

