require "./base"
require "./album_info"

module Spotify
  module Api
    class AlbumList
      JSON.mapping(items: Array(AlbumInfo))

      def albums
        items.map(&.album)
      end
    end
  end
end
