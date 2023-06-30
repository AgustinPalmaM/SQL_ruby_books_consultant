require "terminal-table"
module Helpers
  def welcome_message
    puts "#" * 70
    puts "#{'#' * 10}#{' ' * 14}Welcome to Booking APP#{' ' * 14}#{'#' * 10}"
    puts "#" * 70
  end

  def options_menu
    puts "Write 'menu' at any moment to print the menu again and 'exit' to quit"
    puts "---"
    puts "1. Top 5 publisher by annual revenue"
    puts "2. Search books by [title=string | author=string | publisher=string]"
    puts "3. Count books by [author | publisher | genre]"
    puts "---"
    print "> "
  end

  def goodbye_message
    puts "#" * 70
    puts "#{'#' * 10}#{' ' * 11}Thanks for using Booking APP#{' ' * 11}#{'#' * 10}"
    puts "#" * 70
  end

  def create_table(title, headings, rows)
    table = Terminal::Table.new
    table.title = title
    table.headings = headings
    table.rows = rows
    puts table
  end
end
