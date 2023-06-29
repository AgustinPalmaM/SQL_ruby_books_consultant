require_relative 'fill_database'

class Booking
  include FillDatabase
  include Connection
  def initialize
    fill_db
    @db = Connection.connect_db
  end

  def start
    puts @db
  end

end

booking = Booking.new
booking.start