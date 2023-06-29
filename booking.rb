require_relative 'fill_database'

class Booking
  include FillDatabase
  def initialize
    fill_db
  end
end

booking = Booking.new