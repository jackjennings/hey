require 'hey/dispatcher'
require 'hey/subscriber'
require 'hey/account'

module Hey
  # Sends requests to the Yo API yo endpoints.
  class Yo < Dispatcher
    
    # Sends a request to the +yoall+ endpoint.
    # Raises a +MissingAPITokenError+ error if an API token
    # hasn't been set on the Hey module or Yo instance.
    # Accepts an optional hash of additional parameters to
    # send with the request.
    def all params = {}
      post 'yoall', params
    end
    
    # Sends a request to a user using the +yo+ endpoint.
    # Raises a +MissingAPITokenError+ error if an API token
    # hasn't been set on the Hey module or Yo instance.
    # Accepts an optional hash of additional parameters to
    # send with the request.
    #
    #  Hey::Yo.new.user "worldcup"
    #  Hey::Yo.new.user "worldcup", link: "https://example.com"
    def user name, params = {}
      params.merge! username: name
      post 'yo', params
    end
    
    # Accesses subscriber endpoints using the same API key
    #
    #  yo = Hey::Yo.new api_token: '3858f62230ac3c915f300c664312c63f'
    #  yo.subscribers
    #  # => #<Hey::Subscriber @api_token='3858f62230ac3c915f300c664312c63f'>
    def subscribers
      dispatch Hey::Subscriber
    end
    
    # Accesses accounts endpoints using the same API key
    #
    #  yo = Hey::Yo.new api_token: '3858f62230ac3c915f300c664312c63f'
    #  yo.accounts
    #  # => #<Hey::Account @api_token='3858f62230ac3c915f300c664312c63f'>
    def accounts
      dispatch Hey::Account
    end
    
    # Sends a request to the +yoall+ endpoint using the
    # API token set on the Hey module.
    def self.all *args
      new.all *args
    end
    
    # Sends a request to a user using the +yo+ endpoint.
    # Raises a +MissingAPITokenError+ error if an API token
    # hasn't been set on the Hey module.
    #
    #  Hey::Yo.user "worldcup"
    #  Hey::Yo.user "worldcup", link: "https://example.com"
    def self.user *args
      new.user *args
    end
    
  end
end
