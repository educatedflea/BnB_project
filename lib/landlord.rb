require 'pg'

class Landlord 
	attr_reader :landlord_name

	def initialize(landlord_name:)
		@landlord_name = landlord_name
	end 
	
	def self.fetch_landlord_name
    
		if ENV['ENVIRONMENT'] == 'test'
			connection = PG.connect(dbname: 'bnb_test')
		else 
			connection = PG.connect(dbname: 'bnb')
		end 
		result = connection.exec("SELECT * FROM landlord;")
		result.map do |landlord|
			Landlord.new(landlord_name: landlord['landlord_name'])
		end 
	end  

	def self.create(landlord_name:)
		if ENV['ENVIRONMENT'] == 'test'
			connection = PG.connect(dbname: 'bnb_test')
		else 
			connection = PG.connect(dbname: 'bnb')
		end 

		result = connection.exec("INSERT INTO landlord (landlord_name) VALUES ('#{landlord_name}') RETURNING landlord_name;")
		Landlord.new(landlord_name: result[0]['landlord_name'])
	end 
end 