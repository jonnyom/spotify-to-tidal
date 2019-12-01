require "json"
require "./base"
require "http"

module Tidal
  module Api
    class Favourite < Tidal::Api::Base

      getter resource
      getter id

      ENDPOINT = "users"

      def initialize(@resource : String, @id : Int32); end

      def run!
        Tidal::Api::Base.post(url, form_data)
      end

      private def url
        "#{ENDPOINT}/#{id}/favorites/#{resource}"
      end

      private def form_data
        io = IO::Memory.new
        HTTP::FormData.build(io, "boundary") do |builder|
          builder.field("name", id)
        end
        io.to_s
      end

    end
  end
end
