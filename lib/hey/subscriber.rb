require 'hey/dispatcher'

module Hey
  # Sends requests to the Yo API subscriber endpoint.
  class Subscriber < Dispatcher
    
    # Sends a request to the +subscribers_count+ endpoint.
    # Raises a +MissingAPITokenError+ error if an API token
    # hasn't been set on the Hey module or Yo instance.
    def count
      request = get 'subscribers_count'
      request.json['count']
    end
    
    # Sends a request to the +subscribers_count+ endpoint using the
    # API token set on the Hey module.
    def self.count
      new.count
    end
    
  end
end