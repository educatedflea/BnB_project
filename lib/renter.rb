require 'pg'

class Renter
  attr_reader :renter_name
  def initialize(renter_name:)
    @renter_name = renter_name
  end

  def self.fetch_renter_name
		if ENV['ENVIRONMENT'] == 'test'
			connection = PG.connect(dbname: 'bnb_test')
		else
			connection = PG.connect(dbname: 'bnb')
    end

    result = connection.exec("SELECT * FROM renter;")
		result.map do |renter|
			Renter.new(renter_name: renter['renter_name'])
		end
  end

  def self.create(renter_name:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bnb_test')
    else
       # "in the actual db"
      connection = PG.connect(dbname: 'bnb')
  end
    result = connection.exec("INSERT INTO renter (renter_name) VALUES ('#{renter_name}');")
    Renter.new(renter_name: result[0]['renter_name'])
  end
end
