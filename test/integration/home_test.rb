require_relative '../test_helper'

class HomeTest < Minitest::Test
  include Rack::Test::Methods

  def app
    CaringSite
  end

  def test_responds_to_get
    get '/'
    assert last_response.ok?
  end
  def test_show_correct_header
    get '/'
    assert_match /7<sup>th<\/sup> Annual Golf Classic/,
                 last_response.body
  end
  def test_show_event_date
    get '/'
    assert_match /Saturday, Sept 10, 2016/,
                 last_response.body
  end
  def test_show_event_time
    get '/'
    assert_match /7:30 am Shotgun Start/,
                 last_response.body
  end
  def test_show_join_links
    get '/'
    assert_match /<a href='\/join'>Join Us<\/a>/,
                 last_response.body
    assert_match /<a href='\/join' target='_top'>/,
                 last_response.body
  end
  def test_show_about_link
    get '/'
    assert_match /<a href='\/about'>About<\/a>/,
                 last_response.body
  end
  def test_show_contact_info
    get '/'
    assert_match /Do you have questions or comments?/,
                 last_response.body
    assert_match /Dave Danielson/,
                 last_response.body
    assert_match /Kandi O'Connor/,
                 last_response.body
    assert_match /daveydan21@yahoo.com/,
                 last_response.body
    assert_match /kandi3109@yahoo.com/,
                 last_response.body
  end
  def test_show_footer_link
    get '/'
    assert_match /<a href='http:\/\/www.shilohhouse.org' target='_blank' title='Shiloh House'>Shiloh House<\/a>/,
                 last_response.body


  end
end