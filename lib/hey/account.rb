require 'hey/dispatcher'

module Hey
  # Sends requests to the Yo API accounts endpoint.
  class Account < Dispatcher

    # Sends a request to create an account using the +accounts+ endpoint.
    # Raises a +MissingAPITokenError+ error if an API token
    # hasn't been set on the Hey module or Yo instance.
    # Accepts an optional hash of additional parameters to
    # send with the request.
    #
    #  Hey::Account.new.create "worldcup", "somepass", email: "f@bar.baz"
    def create name, password, params = {}
      params.merge!({
        new_account_username: name,
        new_account_passcode: password
      })
      post 'accounts', params
    end

    # Sends a request to the +accounts+ endpoint using the
    # API token set on the Hey module.
    def self.create *args
      new.create *args
    end

  end
end
