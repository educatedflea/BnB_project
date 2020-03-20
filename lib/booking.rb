require 'pg'

class Booking

  attr_reader :renter_name, :room_name, :date, :request_status, :request_message
  def initialize(renter_name:, room_name:, date:, request_status:, request_message:)
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
      Booking.new(renter_name: request['renter_name'], room_name: request['room_name'], date: request['date'], request_status: request['request_status'], request_message: request['request_message'])
    end
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

end
