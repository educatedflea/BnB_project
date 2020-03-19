require 'pg'

class Booking 

  attr_reader :id, :room_name, :date, :description, :price, :landlord_name, :availability
  def initialize(room_name:, date:, description:, price:)
    @id = id
    @room_name = room_name
    @date = date
    @description = description
    @price = price
    @landlord_name = landlord_name
    @availability = true
  end