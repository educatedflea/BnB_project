require 'sinatra/base'

class BnB<Sinatra::Base
	get '/test' do 
		'Test page'
	end 

 get '/' do
	erb: index
 end 

	run! if app_file ==$0
end 