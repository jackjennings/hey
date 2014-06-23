require 'test_helper'
require 'hey'

class HeyTest < Minitest::Test
  
  def test_gets_api_token
    Hey.instance_variable_set(:@api_token, 'bar')
    assert Hey.respond_to?(:api_token)
    assert_equal Hey.api_token, 'bar'
  end
  
  def test_sets_api_token
    Hey.api_token = 'foo'
    assert_equal Hey.api_token, 'foo'
  end
  
end