require_relative 'environment'
require 'sinatra/base'
require 'haml'

class CaringSite < Sinatra::Base
	before do
	  session[:csrf] ||= Rack::Protection::Base.new(self).random_string
	end
  get '/' do
    # use the views/index.haml file
    @homeTab = true
    haml :index
  end

  get '/join' do
	  @joinTab = true
	  haml :join
  end

  get '/about' do
	  # use the views/about.haml file
	  @aboutTab = true
	  haml :about
  end

  get '/donation/success' do
    @joinTab = true
    "Thank you for donating"
  end
  get '/donation/cancelled' do
  	@joinTab = true
  	"Your donation has been cancelled"
  end

  get '/registration/success' do
    @joinTab = true
    "Thank you for registering"
  end
  get '/registration/cancelled' do
  	@joinTab = true
  	"Your registration has been cancelled"
  end

  get '/registration/lunches/success' do
    @joinTab = true
    "Thank you for registering for lunch"
  end
  get '/registration/lunches/cancelled' do
  	@joinTab = true
  	"Your registration for lunch has been cancelled"
  end

  get '/registration/sponsor/success' do
    @joinTab = true
    "Thank you for registering to sponsor the event"
  end
  get '/registration/sponsor/cancelled' do
  	@joinTab = true
  	"Your registration to sponsor the event has been cancelled"
  end
end