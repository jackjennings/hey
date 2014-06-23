module Hey
  class Yo
    
    attr_accessor :api_token
    
    def initialize options = {}
      @api_token = options[:api_token] || Hey.api_token
    end
    
    def all
      raise MissingAPITokenError unless api_token
      post_request('yoall')
    end
    
    def self.all
      new.all
    end
    
    private
    
    def post_request(method)
      uri = URI("http://api.justyo.co/#{method}/")
      request = Net::HTTP.post_form uri, api_token: api_token
      raise InvalidAPITokenError if JSON.parse(request.body)["code"] == 141
      request
    end
    
  end
end
