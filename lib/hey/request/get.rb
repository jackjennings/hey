require 'hey/request/base'

module Hey
  module Request
    class Get < Base
      
      def send_request route, params
        Net::HTTP.get_response uri(route, url_params(params))
      end
      
      def url_params params
        parts = params.reduce([]) do |arr, param|
          arr << "#{param[0]}=#{param[1]}"
        end
        "?" << parts.join("&") if parts.any?
      end
      
    end
  end
end