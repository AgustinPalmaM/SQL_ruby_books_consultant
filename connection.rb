require "pg"

module Connection
  def self.connect_db
    PG.connect(dbname: "booking")
  end
end
