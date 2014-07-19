require 'hey/yo'
require 'hey/subscriber'

module Hey
  
  class MissingAPITokenError < StandardError; end
  class InvalidAPITokenError < StandardError; end
  class NoSuchUserError < StandardError; end
  
  def self.api_token= value
    @api_token = value
  end
  
  def self.api_token
    @api_token
  end
  
end
