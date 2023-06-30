require "terminal-table"
require "colorize"
module Helpers
  def welcome_message
    puts "#".yellow * 70
    puts "#{'#'.yellow * 10}#{' ' * 14}#{'Welcome to Booking APP'.blue}#{' ' * 14}#{'#'.yellow * 10}"
    puts "#".yellow * 70
  end

  def options_menu
    puts "Write 'menu' at any moment to print the menu again and 'exit' to quit".blue
    puts "---".yellow
    puts "1. Top 5 publisher by annual revenue".blue
    puts "2. Search books by [title=string | author=string | publisher=string]".blue
    puts "3. Count books by [author | publisher | genre]".blue
    puts "---".yellow
  end

  def goodbye_message
    puts "#".yellow * 70
    puts "#{'#'.yellow * 10}#{' ' * 11}#{'Thanks for using Booking APP'.blue}#{' ' * 11}#{'#'.yellow * 10}"
    puts "#".yellow * 70
  end

  def create_table(title, headings, rows)
    table = Terminal::Table.new
    table.title = title.yellow
    table.headings = headings.map(&:blue)
    table.rows = rows.map { |row| row.map(&:yellow) }
    table.style = {:padding_left => 3, :border_x => "=", :border_i => "x"}
    puts table
  end
end
