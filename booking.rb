require_relative 'fill_database'
require_relative 'helpers'
require_relative 'querys'

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
    while input != 'exit'
      input, option = gets.chomp.split
      puts input
      puts option
      case input
      when "1"
        puts "\e[H\e[2J"
        top_five_publishers
      when "2"
        next if option.nil?
        a,b = option.split('=')
        data = {a => b}
        search_books(data) unless [a,b].include?(nil) || !%w[title publisher author].include?(a)
      when "3"
        count_books(option) unless option.nil? || !%w[author publisher genre].include?(option)
      when "menu"
        puts "\e[H\e[2J"
        options_menu
      when 'quit' then goodbye_message
        break
      else
        puts "invalid option"
      end
    end
  end

end

booking = Booking.new
booking.start