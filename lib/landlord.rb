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
end 