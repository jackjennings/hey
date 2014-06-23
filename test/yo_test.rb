require 'test_helper'
require 'hey/yo'

class YoTest < Minitest::Test
  
  def teardown
    Hey.api_token = nil
  end
  
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
    assert_sends_yo {yo.all}
  end
  
  def test_class_method_all_sends_api_request
    Hey.api_token = 'foo'
    assert_sends_yo {Hey::Yo.all}
  end
  
  def test_raises_no_api_token_error
    Hey.api_token = nil
    yo = Hey::Yo.new
    assert_raises(Hey::MissingAPITokenError) do
      yo.all
    end
  end
  
  def assert_sends_yo(&block)
    mock_response = Net::HTTPResponse.new('1.1', '201', 'CREATED')
    mock_response.stub(:read_body, "{\"code\": 201}") do
      mock = MiniTest::Mock.new
      mock.expect(:post_form, mock_response, [URI, Hash])
      Net.stub_const(:HTTP, mock, &block)
      assert mock.verify
    end
  end
  
end