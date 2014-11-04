require 'net/https'
require 'hey/request/base'

module Hey
  module Request
    class Get < Base
      
      def send_request route, params
        location = uri(route, url_params(params))
        Net::HTTP.start(location.host, location.port, use_ssl: true) do |http|
          request = Net::HTTP::Get.new location.request_uri
          response = http.request request
        end
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