require 'sinatra'
require 'haml'

get '/' do
  # use the views/index.haml file
  @homeTab = true
  haml :index
end

get '/sponsors' do
	@sponsorTab = true
	haml :sponsors
end

get '/about' do
	# use the views/about.haml file
	@aboutTab = true
	haml :about
end