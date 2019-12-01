require "json"
require "./album_list"
require "../api/base"

module Tidal
  module Models
    class Artist
      JSON.mapping(
        id: Int32,
        name: String,
        artistTypes: { type: Array(String), nilable: true },
        url: { type: String, nilable: true },
        picture: { type: String, nilable: true },
        popularity: { type: Int32, nilable: true },
      )

      def albums
        AlbumList.from_json(Tidal::Api::Base.get(album_url).body)
      end

      private def album_url
        "artists/#{self.id}/albums"
      end
    end
  end
end
