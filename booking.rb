require_relative 'fill_database'

class Booking
  include FillDatabase
  def initialize
    fill
  end
end

booking = Booking.new