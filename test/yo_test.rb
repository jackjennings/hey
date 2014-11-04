require 'test_helper'
require 'hey/yo'

class YoTest < Minitest::Test
  
  def teardown
    WebMock.reset!
    Hey.api_token = nil
  end
  
  def test_all_sends_api_request
    stub_post = stub_request(:post, "http://api.justyo.co/yoall/")
      .with(:body => {"api_token"=>"foo"})
    Hey::Yo.new(api_token: 'foo').all
    assert_requested stub_post
  end
  
  def test_class_method_all_sends_api_request
    stub_post = stub_request(:post, "http://api.justyo.co/yoall/")
      .with(:body => {"api_token"=>"foo"})
    Hey.api_token = 'foo'
    Hey::Yo.all
    assert_requested stub_post
  end
  
  def test_user_sends_api_request
    stub_post = stub_request(:post, "http://api.justyo.co/yo/")
      .with(:body => {"api_token"=>"foo", "username"=>"YOJOBS"})
    Hey::Yo.new(api_token: 'foo').user('YOJOBS')
    assert_requested stub_post
  end
  
  def test_class_method_user_sends_api_request
    stub_post = stub_request(:post, "http://api.justyo.co/yo/")
      .with(:body => {"api_token"=>"foo", "username"=>"YOJOBS"})
    Hey.api_token = 'foo'
    Hey::Yo.user('YOJOBS')
    assert_requested stub_post
  end
  
  def test_raises_no_api_token_error
    Hey.api_token = nil
    yo = Hey::Yo.new
    assert_raises(Hey::MissingAPITokenError) do
      yo.all
    end
  end
  
  def test_subscribers_returns_subscriber
    yo = Hey::Yo.new api_token: 'foo'
    subscriber = yo.subscribers
    assert subscriber.is_a?(Hey::Subscriber)
    assert_equal subscriber.api_token, yo.api_token
  end

  def test_acounts_returns_account
    yo = Hey::Yo.new api_token: 'foo'
    account = yo.accounts
    assert account.is_a?(Hey::Account)
    assert_equal account.api_token, yo.api_token
  end

  def test_sends_link_to_all
    stub_post = stub_request(:post, "http://api.justyo.co/yoall/")
      .with(:body => {"api_token"=>"foo", "link"=>"http://example.com"})
    Hey.api_token = 'foo'
    Hey::Yo.all link: "http://example.com"
    assert_requested stub_post
  end

  def test_sends_link_to_user
    stub_post = stub_request(:post, "http://api.justyo.co/yo/")
      .with(:body => {"api_token"=>"foo", "link"=>"http://example.com",
        "username"=>"YOJOBS"})
    Hey.api_token = 'foo'
    Hey::Yo.user "YOJOBS", link: "http://example.com"
    assert_requested stub_post
  end
  
end
