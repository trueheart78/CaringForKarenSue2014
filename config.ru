require './load_path'
require 'bundler_init'
require 'caring_site'

use Rack::Session::Cookie, secret: ENV['APP_SECRET_HASH']
use Rack::Protection::AuthenticityToken
use Rack::Protection::EscapedParams

run CaringSite.new
