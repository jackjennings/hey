require 'hey/request/get'
require 'hey/request/post'

module Hey
  module Request

    def self.of_type method
      self.const_get method.to_s.capitalize
    end

  end
end
