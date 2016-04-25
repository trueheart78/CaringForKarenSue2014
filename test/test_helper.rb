ENV['RACK_ENV'] = 'test'
require_relative '../load_path'
require 'bundler_init'
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'

require 'caring_site'

require_relative 'minitest_context'
