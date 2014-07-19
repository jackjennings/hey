require 'hey/dispatcher'
require 'hey/subscriber'

module Hey
  # Sends requests to the Yo API yo endpoints.
  class Yo < Dispatcher
    
    # Sends a request to the +yoall+ endpoint.
    # Raises a +MissingAPITokenError+ error if an API token
    # hasn't been set on the Hey module or Yo instance.
    def all
      raise_for_missing_api_token!
      post 'yoall'
    end
    
    # Sends a request to a user using the +yo+ endpoint.
    # Raises a +MissingAPITokenError+ error if an API token
    # hasn't been set on the Hey module or Yo instance.
    #
    #  Hey::Yo.new.user "worldcup"
    def user name
      raise_for_missing_api_token!
      post 'yo', username: name
    end
    
    # Accesses subscriber endpoints using the same API key
    #
    #  yo = Hey::Yo.new api_token: '3858f62230ac3c915f300c664312c63f'
    #  yo.subscribers.count
    #  # => 2
    def subscribers
      Hey::Subscriber.new api_token: api_token
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
    
  end
end
