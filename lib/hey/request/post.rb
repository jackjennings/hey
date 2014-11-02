require 'hey/request/base'

module Hey
  module Request
    class Post < Base
      
      def send_request route, params
        Net::HTTP.post_form uri(route), params
      end
      
    end
  end
end
