require 'pg'

class Booking

  attr_reader :renter_name, :room_name, :date, :request_status
  def initialize(renter_name:, room_name:, date:, request_status:)
    @renter_name = renter_name
    @room_name = room_name
    @date = date
    @request_status = "pending"
  end

def self.pending
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'bnb_test')
  else
    connection = PG.connect(dbname: 'bnb')
  end
  request = connection.exec("SELECT * FROM bookingrequest;")
  request.map do |request|
  Booking.new(renter_name: request['renter_name'], room_name: request['room_name'], date: request['date'], request_status: request['request_status'])
  end
  end
end
