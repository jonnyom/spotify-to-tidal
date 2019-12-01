require "json"
require "./artist"

module Tidal
  module Models
    class ArtistList
      JSON.mapping(
        limit: Int32,
        offset: Int32,
        totalNumberOfItems: Int32,
        items: Array(Artist),
      )

      def list
        items
      end
    end
  end
end
