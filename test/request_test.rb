require 'test_helper'
require 'hey/request'

class RequestTest < Minitest::Test
  
  def teardown
    WebMock.reset!
    Hey.api_token = nil
  end
  
  def test_get_request
    stub_get = stub_request(:get, "https://api.justyo.co/bar/")
    request = Hey::Request::Get.new 'bar'
    assert_requested stub_get
  end
  
  def test_get_request_with_params
    stub_get = stub_request(:get, "https://api.justyo.co/bar/?foo=baz")
    request = Hey::Request::Get.new 'bar', foo: 'baz'
    assert_requested stub_get
  end
  
  def test_post_request
    stub_post = stub_request(:post, "https://api.justyo.co/bar/")
    dispatcher = Hey::Request::Post.new 'bar'
    assert_requested stub_post
  end
  
  def test_post_request_with_params
    stub_post = stub_request(:post, "https://api.justyo.co/bar/")
      .with(:body => {"foo"=>"baz"})
    dispatcher = Hey::Request::Post.new 'bar', foo: 'baz'
    assert_requested stub_post
  end
  
  def test_of_type_get
    assert_equal Hey::Request::Get, Hey::Request.of_type(:get)
  end
  
  def test_of_type_post
    assert_equal Hey::Request::Post, Hey::Request.of_type(:post)
  end
  
end
