require "../../http/request"
require "uri"
require "json"

module Spotify
  module Api

    class ForbiddenError < Exception; end

    class Base

      AUTHORIZATION = ENV["SPOTIFY_TOKEN"]
      BASE_URL = "https://api.spotify.com/v1/"

      def self.get(url)
        request(url, "GET")
      end

      def self.post(url)
        request(url, "POST")
      end

      def self.request(url, method)
        response = ::Http::Request.make_request(BASE_URL + url, AUTHORIZATION, method)
        if response.status == 401
          raise ForbiddenError.new(response.body)
        end
        response.body
      end

    end
  end
end
