require File.expand_path '../../test_helper.rb', __FILE__

class HomeTest < Minitest::Test
  include Rack::Test::Methods

  def app
    CaringSite
  end

  def test_responds_to_get
    get '/about'
    assert last_response.ok?
  end
  def test_tells_story
    get '/about'
    assert_match /In 2009, our mom, Karen Danielson/,
                 last_response.body
  end
  def test_show_miles_link
    get '/about'
    assert_match /<a href='http:\/\/milesformenkes.com' title='Miles for Menkes'>\s+MilesForMenkes.com\s+<\/a>/,
                 last_response.body
  end
end
