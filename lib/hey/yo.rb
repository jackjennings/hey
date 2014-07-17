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
    
    # Sends a request to a user using the +yo+ endpoint.
    # Raises a +MissingAPITokenError+ error if an API token
    # hasn't been set on the Hey module or Yo instance.
    #
    #  Hey::Yo.new.user "worldcup"
    def user name
      raise MissingAPITokenError unless api_token
      post_request 'yo', username: name
    end
    
    # Sends a request to the +yoall+ endpoint using the
    # API token set on the Hey module.
    def self.all
      new.all
    end
    
    # Sends a request to a user using the +yo+ endpoint.
    # Raises a +MissingAPITokenError+ error if an API token
    # hasn't been set on the Hey module.
    #
    #  Hey::Yo.user "worldcup"
    def self.user name
      new.user name
    end
    
    private
    
    def post_request method, params = {} #:nodoc:
      params = params.merge api_token: api_token
      uri = URI("http://api.justyo.co/#{method}/")
      request = Net::HTTP.post_form uri, params
      raise_for_invalid_code! request
      request
    end
    
    def raise_for_invalid_code! request #:nodoc:
      response = JSON.parse(request.body)
      return unless response["code"] && response["code"] == 141
      case response["error"]
      when "NO SUCH USER"
        raise NoSuchUserError 
      else
        raise InvalidAPITokenError
      end
    end
    
  end
end
