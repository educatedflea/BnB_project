require 'pg'
# require 'landlord'

class Room
attr_reader :id, :room_name, :date, :description, :price, :landlord_name, :availability
  def initialize(room_name:, date:, description:, price:)
    @id = id
    @room_name = room_name
    @date = date
    @description = description
    @price = price
    @landlord_name = landlord_name
    # ^ need to pick this up from landlord_name somehow?
    @availability = true
  end

  def self.all
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'bnb_test')
  else
    connection = PG.connect(dbname: 'bnb')
  end
  rooms = connection.exec("SELECT * FROM rooms;")
  rooms.map do |room|
  Room.new(room_name: room['room_name'], date: room['date'], description: room['description'], price: room['price'])
  end
end

def self.create(room_name:, date:, description:, price:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'bnb_test')
  else
     "in the actual db"
    connection = PG.connect(dbname: 'bnb')
end
  result = connection.exec("INSERT INTO rooms (room_name, date, description, price) VALUES ('#{room_name}', '#{date}', '#{description}', '#{price}') RETURNING room_name,date,description,price;")
  Room.new(room_name: result[0]['room_name'], date: result[0]['date'], description: result[0]['description'], price: result[0]['price'])
end

end
