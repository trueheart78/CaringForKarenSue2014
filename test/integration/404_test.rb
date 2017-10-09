# frozen_string_literal: true

require_relative '../test_helper'

class PageNotFoundTest < Minitest::Test
  include Rack::Test::Methods

  def app
    CaringSite
  end

  def test_returns_404_on_login
    get '/login'
    assert_equal(404, last_response.status)
  end

  def test_returns_404_on_favicon
    get '/favicon.ico'
    assert_equal(404, last_response.status)
  end
end
