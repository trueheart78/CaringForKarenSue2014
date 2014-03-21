require 'sinatra'
require 'haml'

get '/' do
  # use the views/index.haml file
  haml :index
end

get '/agent' do
  # use the views/agent.haml file
  haml :agent
end
