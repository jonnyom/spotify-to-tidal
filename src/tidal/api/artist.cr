require "../models/artist"
require "./base"

module Tidal
  module Api
    class Artist

      def self.find(id)
        Tidal::Models::Artist.from_json(Tidal::Api::Base.get(url(id)))
      end

      private def self.url(id)
        "artists/#{id}"
      end

    end
  end
end
