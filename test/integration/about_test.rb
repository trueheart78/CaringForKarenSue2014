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
  def test_show_shiloh_link
    get '/about'
    assert_match /<a href='http:\/\/www.shilohhouse.org' title='Shiloh House'>\s+www.shilohhouse.org\s+<\/a>/,
                 last_response.body
  end
end
