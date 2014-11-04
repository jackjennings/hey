require 'test_helper'
require 'hey/account'

class AccountTest < Minitest::Test
  
  def teardown
    WebMock.reset!
  end
  
  def test_create_sends_api_request
    stub_get = stub_request(:post, "https://api.justyo.co/accounts/")
      .with(:body => {
        "api_token"=>"foo",
        "new_account_username"=>"foo",
        "new_account_passcode"=>"bar"
      })

    account = Hey::Account.new(api_token: 'foo').create("foo", "bar")

    assert_requested stub_get
  end

  def test_create_sends_api_request_with_params
    stub_get = stub_request(:post, "https://api.justyo.co/accounts/")
      .with(:body => {
        "api_token"=>"foo",
        "new_account_username"=>"foo",
        "new_account_passcode"=>"bar",
        "email"=>"f@bar.baz"
      })

    account = Hey::Account.new(api_token: 'foo').create("foo", "bar", {
      email: "f@bar.baz"
    })

    assert_requested stub_get
  end
  
end
