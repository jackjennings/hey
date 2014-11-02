require 'json'
require 'net/http'

module Hey
  module Request
    class Base
      
      URL = "http://api.justyo.co"
      ERROR_CODE = 141
      
      attr_accessor :response
      
      def initialize route, params = {}
        @response = send_request route, params
        raise_for_invalid_code!
      end
      
      def uri route, data = nil #:nodoc:
        URI([URL, route, data].join("/"))
      end
      
      def raise_for_invalid_code! #:nodoc:
        return unless has_error?
        case error_message
        when "NO SUCH USER"
          raise NoSuchUserError 
        else
          raise InvalidAPITokenError
        end
      end
      
      def has_error?
        json && json["code"] == ERROR_CODE
      end
      
      def error_message
        json["error"]
      end

      def get_response_body request #:nodoc:
        request && request.body ? JSON.parse(request.body) : nil
      end
      
      def json
        @json ||= get_response_body @response
      end
      
    end
  end
end
