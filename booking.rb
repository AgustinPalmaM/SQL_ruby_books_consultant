require_relative "fill_database"
require_relative "helpers"
require_relative "querys"

class Booking
  include FillDatabase
  include Connection
  include Helpers
  include Querys
  def initialize
    fill_db
    @db = Connection.connect_db
  end

  def start
    welcome_message

    puts "\e[H\e[2J"
    options_menu
    input = nil
    while input != "exit"
      print "> "
      input, option = gets.chomp.split
      case input
      when "1"
        puts "\e[H\e[2J"
        top_five_publishers
      when "2"
        next if validation_search(option)

        a, b = option.split("=")
        data = { a => b }
        search_books(data)
      when "3"
        next if validation_count(option)

        count_books(option)
      when "menu"
        puts "\e[H\e[2J"
        options_menu
      when "quit" then goodbye_message
                       break
      else
        puts "invalid option"
      end
    end
  end

  def validation_search(to_validate)
    return true if to_validate.nil? || !to_validate.include?("=")
    return true if to_validate.split("=").first.nil? || to_validate.split("=").last.nil?
    return true unless ["title", "publisher", "author"].include?(to_validate.split("=").first)
  end

  def validation_count(to_validate)
    return true if to_validate.nil? || !["author", "publisher", "genre"].include?(to_validate)
  end
end

booking = Booking.new
booking.start
