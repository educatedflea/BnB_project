require 'sinatra/base'

class BnB<Sinatra::Base
	get '/test' do 
		'Test page'
	end 

	run! if app_file ==$0
end 