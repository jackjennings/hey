require 'test_helper'
require 'hey/dispatcher'

class DispatcherTest < Minitest::Test
  
  def teardown
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
  
  def test_raises_for_absent_api_token
    assert_raises Hey::MissingAPITokenError do
      dispatcher = Hey::Dispatcher.new
      dispatcher.merge_api_token! {}
    end
  end
  
  def test_merges_api_token
    dispatcher = Hey::Dispatcher.new api_token: 'foo'
    params = {}
    dispatcher.send(:merge_api_token!, params)
    assert 'foo', params[:api_token]
  end
  
  def test_raises_for_absent_api_token
    assert_raises Hey::MissingAPITokenError do
      dispatcher = Hey::Dispatcher.new
      dispatcher.send(:merge_api_token!, {})
    end
  end
  
end
