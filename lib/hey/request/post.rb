require 'net/https'
require 'hey/request/base'

module Hey
  module Request
    class Post < Base
      
      def send_request route, params
        location = uri(route)
        Net::HTTP.start(location.host, location.port, use_ssl: true) do |http|
          request = Net::HTTP::Post.new location.request_uri
          request.form_data = params
          response = http.request request
        end
      end
      
    end
  end
end
