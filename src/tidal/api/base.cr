require "../../http/request"
require "uri"
require "json"

module Tidal
  module Api
    class Base

      AUTHORIZATION = ENV["TIDAL_TOKEN"]
      BASE_URL = "https://desktop.tidal.com/v1/"
      BASIC_QUERY_PARAMS = "?locale=en_US&deviceType=DESKTOP&countryCode=IE"

      def self.get(url, additional_query_params = {} of String => String)
        request(url, "GET", additional_query_params)
      end

      def self.post(url, additional_query_params = {} of String => String)
        request(url, "POST", additional_query_params)
      end

      private def self.request(url, method, additional_query_params = {} of String => String)
        request_url = "#{BASE_URL}#{url}#{BASIC_QUERY_PARAMS}"
        additional_query_params.each { |param, value| request_url += "&#{param}=#{value}" }
        ::Http::Request.make_request(request_url, AUTHORIZATION, method).body
      end

    end
  end
end
