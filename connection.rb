require "pg"

module Connection
  def initialize
    @db = PG.connect(dbname: "booking")
  end
end
