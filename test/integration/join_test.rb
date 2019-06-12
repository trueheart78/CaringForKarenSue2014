# frozen_string_literal: true

require File.expand_path '../../test_helper.rb', __FILE__

class JoinTest < Minitest::Test
  include Rack::Test::Methods

  def app
    CaringSite
  end

  def test_responds_to_get
    get '/join'
    assert last_response.ok?
  end

  def test_show_event_deadline
    get '/join'
    assert_match(/September 4<sup>th<\/sup>, 2019/,
                 last_response.body)
  end
end
