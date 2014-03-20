require 'sinatra'
require 'haml', '4.0.5'

get '/' do
  # use the views/index.erb file
  erb :index
end

get '/agent' do
  # use the views/agent.erb file
  erb :agent
end
