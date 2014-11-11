require 'hey/request'

module Hey
  class Dispatcher
    
    # (Optional) Should be set if an API token hasn't be set
    # on the Hey module.
    attr_accessor :api_token
    
    # Optionally accepts a hash containing an API token.
    # Defaults to the API token set on the Hey module.
    # 
    #  Hey::Yo.new api_token: '3858f62230ac3c915f300c664312c63f'
    def initialize options = {}
      @api_token = options[:api_token]
    end
    
    # Returns the API token to be used when making requests. This will either
    # be the api_token set on initialization or the token set on the Hey
    # module itself.
    def api_token
      @api_token || Hey.api_token
    end
    
    private
    
    def get route #:nodoc:
      request :get, route
    end
    
    def post route, params = {} #:nodoc:
      request :post, route, params
    end
    
    def request method, route, params = {} #:nodoc:
      merge_api_token! params
      Request.of_type(method).new route, params
    end
    
    def merge_api_token! params #:nodoc:
      raise_for_missing_api_token!
      params.merge! api_token: api_token
    end
    
    def raise_for_missing_api_token! #:nodoc:
      raise MissingAPITokenError unless api_token
    end
    
    def dispatch klass
      klass.new api_token: api_token
    end
    
  end
end
