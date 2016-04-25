require 'environment'
require 'sinatra/base'
require 'tilt/erb'

class CaringSite < Sinatra::Base
  before do
    session[:csrf] ||= Rack::Protection::Base.new(self).random_string
  end
  get '/' do
    # use the views/index.erb file
    @homeTab = 'active'
    erb :index
  end

  get '/env' do
    redirect '/' if ENV['NODE_ENV'] == 'production'
    erb :environment
  end

  get '/join' do
    @joinTab = 'active'
    erb :join
  end

  post '/join' do
    if params[:email].empty? or params[:name].empty?
      redirect '/join'
    end
    #handle the post data, then return success
    require 'emailer'
    emailer = Emailer.new(params)
    emailer.send_admin_email
    if params[:checkout] == 'check'
      emailer.send_user_email
    end
    'success'
  end

  get '/about' do
    # use the views/about.erb file
    @aboutTab = 'active'
    erb :about
  end

  get '/donation/success' do
    @joinTab = 'active'
    erb :donation_success
  end
  get '/donation/cancelled' do
    @joinTab = 'active'
    erb :donation_cancelled
  end

  get '/registration/success' do
    @joinTab = 'active'
    erb :registration_success
  end
  get '/registration/cancelled' do
    @joinTab = 'active'
    erb :registration_cancelled
  end

  get '/registration/lunches/success' do
    @joinTab = 'active'
    erb :lunches_success
  end
  get '/registration/lunches/cancelled' do
    @joinTab = 'active'
    erb :lunches_cancelled
  end

  get '/registration/sponsor/success' do
    @joinTab = 'active'
    erb :sponsor_success
  end
  get '/registration/sponsor/cancelled' do
    @joinTab = 'active'
    erb :sponsor_cancelled
  end
  get '/registration/check/confirmation' do
    @joinTab = 'active'
    erb :check_confirmation
  end
end
