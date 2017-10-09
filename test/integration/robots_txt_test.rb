# frozen_string_literal: true

require_relative '../test_helper'

class RobotsTxt < Minitest::Test
  include Rack::Test::Methods

  def app
    CaringSite
  end

  def test_returns_ok
    get '/robots.txt'
    assert last_response.ok?
  end

  def test_returns_expected_body
    get '/robots.txt'
    assert_equal("user-agent: *\ndisallow:\n", last_response.body)
  end
end
