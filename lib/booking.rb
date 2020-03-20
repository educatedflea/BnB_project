require 'pg'
require_relative 'rooms'

class Booking


  attr_reader :renter_name, :room_name, :date, :request_status, :request_message, :id
  def initialize(id:,renter_name:, room_name:, date:, request_status:, request_message:)
    @id = id
    @renter_name = renter_name
    @room_name = room_name
    @date = date
    @request_status = "pending"
    @request_message = request_message
  end


def self.pending
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'bnb_test')
  else
    connection = PG.connect(dbname: 'bnb')
  end
  request = connection.exec("SELECT * FROM bookingrequest;")
  request.map do |request|
  Booking.new(id: request['id'], renter_name: request['renter_name'], room_name: request['room_name'], date: request['date'], request_status: request['request_status'],request_message: request['request_message'])
  end
  
  def self.request_message(request_message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bnb_test')
    else
      connection = PG.connect(dbname: 'bnb')
    end
    result = connection.exec("INSERT INTO bookingrequest (request_message) VALUES ('#{request_message}') RETURNING request_message;")
    result[0]['request_message']
  end


  def self.approve(id)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bnb_test')
    else
      connection = PG.connect(dbname: 'bnb')
  end
  result = connection.exec("UPDATE rooms SET availability='Not available' WHERE id=#{id};")

  # result = connection.exec
  # ^^ this one changes bookingrequest status to approved
  end
end
