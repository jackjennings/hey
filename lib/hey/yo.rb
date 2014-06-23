module Hey
  class Yo
    
    attr_accessor :api_token
    
    def initialize options = {}
      @api_token = options[:api_token] || Hey.api_token
    end
    
    def all
      raise NoAPITokenError unless @api_token
      uri = URI('http://api.justyo.co/yoall')
      Net::HTTP.post_form uri, api_token: api_token
    end
    
    def self.all
      new.all
    end
    
  end
end
