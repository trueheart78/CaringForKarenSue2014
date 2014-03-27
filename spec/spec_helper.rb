$: << File.expand_path('../..',__FILE__)

require 'app'
require 'rack/test'

def app
  CaringSite.new
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end