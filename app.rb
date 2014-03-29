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
    haml :donation_success
  end
  get '/donation/cancelled' do
  	@joinTab = true
  	haml :donation_cancelled
  end

  get '/registration/success' do
    @joinTab = true
    haml :registration_success
  end
  get '/registration/cancelled' do
  	@joinTab = true
  	haml :registration_cancelled
  end

  get '/registration/lunches/success' do
    @joinTab = true
    haml :lunches_success
  end
  get '/registration/lunches/cancelled' do
  	@joinTab = true
  	haml :lunches_cancelled
  end
  
  get '/registration/sponsor/success' do
    @joinTab = true
    haml :sponsor_success
  end
  get '/registration/sponsor/cancelled' do
  	@joinTab = true
  	haml :sponsor_cancelled
  end
end