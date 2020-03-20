require 'sinatra/base'
require_relative './lib/landlord'
require_relative './lib/rooms'
require_relative './lib/renter'
require_relative './lib/booking'

class BnB<Sinatra::Base
	get '/test' do
		'Test page'
	end

 get '/' do
	erb :index
 end

 get '/landlord_sign_in' do
  erb :landlord_signin
 end

 post '/landlord_sign_in' do 
   @landlord_name = Landlord.create(landlord_name: params[:landlord_name])
  redirect '/account_landlord'
 end 

 get '/account_landlord' do
   @landlord_name = Landlord.fetch_landlord_name[-1]
	erb :landlord_dashboard
 end

 get '/create_listing' do
	 erb :create_listing
 end

 post '/create_listing' do
	Room.create(room_name: params[:room_name], date: params[:date], description: params[:description], price: params[:price])
 	redirect '/view_listings'
 end

 get '/pending_requests' do
		@requests = Booking.pending
 	erb :pending_requests
 end

	get '/renter_sign_in' do
		erb :renter_signin
	end

 	post '/renter_sign_in' do
		Renter.create(renter_name: params[:renter_name])
		redirect '/view_listings'
	end

  get '/view_listings' do
   # @renter_name = Renter.fetch_renter_name[0]
	 @rooms = Room.all
	 erb :view_listings
 end

 get '/request' do
  erb :request
 end

 get '/request_sent' do
  erb :request_sent
 end

	run! if app_file ==$0
end
