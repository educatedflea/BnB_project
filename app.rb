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

 get '/account_landlord' do
	 @landlord_name = Landlord.fetch_landlord_name[0]
	 erb :landlord_dashboard
 end

 get '/create_listing' do
	 erb :create_listing
 end

 post '/create_listing' do
	p params[:room_name]
	Room.create(room_name: params[:room_name], date: params[:date], description: params[:description], price: params[:price])
 	redirect '/account_renter'
 end

 get '/pending_requests' do
p "first"
	 p @requests = Booking.pending
 	erb :pending_requests
 end

 get '/renter_sign_in' do
  erb :renter_signin
 end

  get '/view_listings' do
   @renter_name = Renter.fetch_renter_name[0]
	 @rooms = Room.all
  erb :view_listings
 end

 get '/request' do
  erb :request
 end

	run! if app_file ==$0
end
