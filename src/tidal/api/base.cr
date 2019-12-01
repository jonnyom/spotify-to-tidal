require "../../http/request"
require "uri"
require "json"

module Tidal
  module Api

    class TidalError < Exception; end
    class AuthenticationError < TidalError; end
    class RateLimitError < TidalError; end
    class ForbiddenError < TidalError; end

    class Base

      AUTHORIZATION = ENV["TIDAL_TOKEN"]
      BASE_URL = "https://desktop.tidal.com/v1/"
      BASIC_QUERY_PARAMS = "?locale=en_US&deviceType=DESKTOP&countryCode=IE"

      def self.get(url, additional_query_params = {} of String => String)
        request(url, "GET", additional_query_params)
      end

      def self.post(url, body, additional_query_params = {} of String => String)
        request(url, "POST", body, additional_query_params)
      end

      private def self.request(url, method, body = nil, additional_query_params = {} of String => String)
        request_url = "#{BASE_URL}#{url}#{BASIC_QUERY_PARAMS}"
        additional_query_params.each { |param, value| request_url += "&#{param}=#{value}" }
        response = ::Http::Request.make_request(request_url, AUTHORIZATION, method, body)
        return response.body if response.status_code >= 200 && response.status_code < 300
        case response.status_code
          when 401
            raise AuthenticationError.new(response.body)
          when 403
            raise ForbiddenError.new(response.body)
          when 429
            raise RateLimitError.new(response.body)
          else
            raise TidalError.new(response.body)
        end
      end

    end
  end
end
