require 'json'
require 'net/http'

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
      @api_token = options[:api_token] || Hey.api_token
    end
    
    private
    
    def uri route, data = nil #:nodoc:
      URI("http://api.justyo.co/#{route}/#{data}")
    end
    
    def get route #:nodoc:
      response = Net::HTTP.get_response uri(route, "?api_token=#{api_token}")
      raise_for_invalid_code! response
      response
    end
    
    def post route, params = {} #:nodoc:
      params = params.merge api_token: api_token
      response = Net::HTTP.post_form uri(route), params
      raise_for_invalid_code! response
      response
    end
    
    def raise_for_missing_api_token! #:nodoc:
      raise MissingAPITokenError unless api_token
    end
    
    def raise_for_invalid_code! response #:nodoc:
      body = get_response_body(response)
      return unless body && body["code"] == 141
      case body["error"]
      when "NO SUCH USER"
        raise NoSuchUserError 
      else
        raise InvalidAPITokenError
      end
    end
    
    def get_response_body request #:nodoc:
      request && request.body ? JSON.parse(request.body) : nil
    end
    
  end
end
