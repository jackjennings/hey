require 'test_helper'
require 'hey/yo'
require 'minitest/mock'
require 'minitest/stub_const'

class YoTest < Minitest::Test
  
  def test_sets_api_token_on_instance
    yo = Hey::Yo.new(api_token: 'foo')
    assert_equal 'foo', yo.api_token
  end
  
  def test_defaults_to_hey_api_token
    Hey.api_token = 'bar'
    yo = Hey::Yo.new
    assert_equal 'bar', yo.api_token
  end
  
  def test_all_sends_api_request
    yo = Hey::Yo.new(api_token: 'foo')
    mock = MiniTest::Mock.new
    mock.expect(:post_form, nil, [URI, Hash])
    Net.stub_const(:HTTP, mock) {yo.all}
    assert mock.verify
  end
  
  def test_raises_no_api_token_error
    Hey.api_token = nil
    yo = Hey::Yo.new
    assert_raises(Hey::NoAPITokenError) do
      yo.all
    end
  end
  
end