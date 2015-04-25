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
    assert_match /September 1, 2015/,
                 last_response.body
  end
end
