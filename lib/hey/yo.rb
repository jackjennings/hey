module Hey
  class Yo
    
    attr_accessor :api_token
    
    def initialize options = {}
      @api_token = options[:api_token] || Hey.api_token
    end
    
    def all
      raise MissingAPITokenError unless api_token
      post_request 'yoall'
    end
    
    def self.all
      new.all
    end
    
    private
    
    def post_request method
      uri = URI("http://api.justyo.co/#{method}/")
      request = Net::HTTP.post_form uri, api_token: api_token
      raise InvalidAPITokenError if invalid_code? request
      request
    end
    
    def invalid_code? request
      response = JSON.parse(request.body)
      response["code"] && response["code"] == 141
    end
    
  end
end
