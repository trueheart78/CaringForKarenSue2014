require './load_path'
require 'bundler_init'
require 'caring_site'

use Rack::Session::Cookie, secret: ENV['APP_SECRET_HASH']
use Rack::Protection, use: :authenticity_token

run CaringSite.new
