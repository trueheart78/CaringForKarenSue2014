# frozen_string_literal: true

require File.expand_path '../../test_helper.rb', __FILE__

class AboutTest < Minitest::Test
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
    assert_match(/In 2009, our mom, Karen Danielson/,
                 last_response.body)
    assert_match(/This is our tenth year/,
                 last_response.body)
  end

  def test_show_charity_link
    get '/about'
    assert_match(%r{<a href='https:\/\/www.therightstepinc.org' target='_blank' title='The Right Step, Inc.'>\s+www.therightstepinc.org\s+<\/a>},
                 last_response.body)
  end
end
