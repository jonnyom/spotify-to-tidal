require "../../http/request"
require "uri"
require "json"

module Spotify
  module Api

    class SpotifyError < Exception; end
    class AuthenticationError < SpotifyError; end
    class RateLimitError < SpotifyError; end
    class ForbiddenError < SpotifyError; end

    class Base

      AUTHORIZATION = ENV["SPOTIFY_TOKEN"]
      BASE_URL = "https://api.spotify.com/v1/"

      def self.get(url)
        puts "in GET"
        request(url, "GET")
      end

      def self.post(url)
        request(url, "POST")
      end

      def self.request(url, method)
        response = ::Http::Request.make_request(BASE_URL + url, AUTHORIZATION, method)
        puts response.status_code
        return response.body if response.status_code >= 200 && response.status_code < 300
        case response.status_code
          when 401
            raise AuthenticationError.new(response.body)
          when 403
            raise ForbiddenError.new(response.body)
          when 429
            raise RateLimitError.new(response.body)
          else
            raise SpotifyError.new(response.status_code.to_s)
        end
      end

    end
  end
end
