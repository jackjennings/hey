require 'net/http'
require 'hey/yo'

module Hey
  
  class NoAPITokenError < StandardError; end
  
  def self.api_token= value
    @api_token = value
  end
  
  def self.api_token
    @api_token
  end
  
end
