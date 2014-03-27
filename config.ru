require 'rubygems'
require 'bundler'

Bundler.require

require './app.rb'

use Rack::Session::Cookie, secret: ENV['APP_SECRET_HASH']
use Rack::Protection, use: :authenticity_token

run CaringSite.new