require 'config/environment'
require 'config/rollbar'
require 'sinatra/base'
require 'tilt/erb'

class CaringSite < Sinatra::Base
  use Rollbar::Middleware::Sinatra

  before do
    session[:csrf] ||= Rack::Protection::Base.new(self).random_string
    @homeTab = nil
    @joinTab = nil
    @aboutTab = nil
  end

  get '/' do
    # use the views/index.erb file
    @homeTab = 'active'
    erb :index
  end

  get '/env' do
    redirect '/' if ENV['RACK_ENV'] == 'production'
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
    require 'admin_contact'
    require 'emailer'
    admin = AdminContact.new(params[:name],params[:email],params[:checkout],params[:value])
    if Emailer.send_admin_email(admin)
      if admin.payment_by_check?
        require 'contact'
        contact = Contact.new(params[:name],params[:email],params[:checkout],params[:value])
        Emailer.send_user_email(contact)
      end
      status 201
    else
      status 404
    end
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
