require 'test_helper'
require 'hey/dispatcher'

class DispatcherTest < Minitest::Test
  
  def teardown
    WebMock.reset!
    Hey.api_token = nil
  end
  
  def test_sets_api_token_on_instance
    dispatcher = Hey::Dispatcher.new api_token: 'foo'
    assert_equal 'foo', dispatcher.api_token
  end
  
  def test_defaults_to_hey_api_token
    Hey.api_token = 'bar'
    dispatcher = Hey::Dispatcher.new
    assert_equal 'bar', dispatcher.api_token
  end
  
  def test_get_request
    stub_get = stub_request(:get, "http://api.justyo.co/bar/?api_token=foo")
    dispatcher = Hey::Dispatcher.new api_token: 'foo'
    dispatcher.send :get, 'bar'
    assert_requested stub_get
  end
  
  def test_post_request
    stub_post = stub_request(:post, "http://api.justyo.co/bar/")
      .with(:body => {"api_token"=>"foo"})
    dispatcher = Hey::Dispatcher.new api_token: 'foo'
    dispatcher.send :post, 'bar'
    assert_requested stub_post
  end
  
end