require "json"
require "./base"

module Tidal
  module Api
    class Favourite < Tidal::Api::Base

      getter resource
      getter id

      ENDPOINT = "users"

      def initialize(@resource : String, @id : Int32); end

      def run!
        Tidal::Api::Base.post(url)
      end

      private def url
        "#{ENDPOINT}/#{id}/favorites/#{resource}"
      end

    end
  end
end
