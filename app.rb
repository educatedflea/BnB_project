require 'sinatra/base'
require_relative './lib/landlord'
require_relative './lib/rooms'

class BnB<Sinatra::Base
	get '/test' do
		'Test page'
	end

 get '/' do
	erb :index
 end

 get '/landlord/sign_in' do
  erb :landlord_signin
 end

 get '/account/landlord' do
	 @landlord_name = Landlord.fetch_landlord_name[0]
	 erb :landlord_dashboard
 end

 get '/create_listing' do
	 erb :create_listing
 end

 post '/create_listing' do
	 Room.create(room_name: params[:room_name], date: params[:date], description: params[:description], price: params[:price])
 	redirect '/account/renter'
 end

 get '/pending_requests' do
 	erb :pending_requests
 end

 get '/renter/sign_in' do
  erb :renter_signin
 end

 get '/account/renter' do
	 @rooms = Room.all
  erb :renter_dashboard
 end


	run! if app_file ==$0
end
