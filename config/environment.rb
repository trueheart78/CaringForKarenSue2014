if ENV['RACK_ENV'] != 'production'
  require 'dotenv'
  Dotenv.load ".env.#{ENV['RACK_ENV']}", '.env.local', '.env'
end
