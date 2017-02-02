require 'dotenv'
Dotenv.load ".env.#{ENV['RACK_ENV']}", '.env.local', '.env'
