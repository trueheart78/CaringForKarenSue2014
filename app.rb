require 'sinatra'
require 'haml'

get '/' do
  # use the views/index.haml file
  haml :index
end

get '/sponsors' do
	haml :sponsors
end

get '/about' do
	# use the views/about.haml file
	haml :about
end