require 'test_helper'
require 'hey/subscriber'

class SubscriberTest < Minitest::Test
  
  def teardown
    WebMock.reset!
    Hey.api_token = nil
  end
  
  def test_count_sends_api_request
    stub_get = stub_request(:get, "http://api.justyo.co/subscribers_count/?api_token=foo")
      .to_return(body: '{"count": 2}')
    count = Hey::Subscriber.new(api_token: 'foo').count
    assert_requested stub_get
    assert_equal count, 2
  end
  
  def test_class_method_all_sends_api_request
    stub_get = stub_request(:get, "http://api.justyo.co/subscribers_count/?api_token=foo")
      .to_return(body: '{"count": 2}')
    Hey.api_token = 'foo'
    count = Hey::Subscriber.count
    assert_requested stub_get
    assert_equal count, 2
  end
  
end