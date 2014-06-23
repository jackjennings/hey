module Hey
  # Sends requests to the Yo API endpoint.
  class Yo
    
    # (Optional) Should be set if an API token hasn't be set
    # on the Hey module.
    attr_accessor :api_token
    
    # Optionally accepts a hash containing an API token.
    # Defaults to the API token set on the Hey module.
    # 
    #  Hey::Yo.new api_token: '3858f62230ac3c915f300c664312c63f'
    def initialize options = {}
      @api_token = options[:api_token] || Hey.api_token
    end
    
    # Sends a request to the +yoall+ endpoint.
    # Raises a +MissingAPITokenError+ error if an API token
    # hasn't been set on the Hey module or Yo instance.
    def all
      raise MissingAPITokenError unless api_token
      post_request 'yoall'
    end
    
    # Sends a request to the +yoall+ endpoint using the
    # API token set on the Hey module.
    def self.all
      new.all
    end
    
    private
    
    def post_request method #:nodoc:
      uri = URI("http://api.justyo.co/#{method}/")
      request = Net::HTTP.post_form uri, api_token: api_token
      raise InvalidAPITokenError if invalid_code? request
      request
    end
    
    def invalid_code? request #:nodoc:
      response = JSON.parse(request.body)
      response["code"] && response["code"] == 141
    end
    
  end
end
