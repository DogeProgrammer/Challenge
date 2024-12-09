# frozen_string_literal: true

module Request
  module JsonHelpers
    def last_response
      @last_response ||= JSON.parse(response.body, symbolize_names: true)
    end
  end
end
