require File.expand_path '../../test_helper.rb', __FILE__

class HomeTest < Minitest::Test
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
    assert_match /August 28<sup>th<\/sup>, 2017/,
                 last_response.body
  end
end
