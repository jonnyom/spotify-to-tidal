require "./base"
require "./album_list"

module Spotify
  module Api
    class User
      def self.albums(offset : Int32 = 0, limit : Int32 = 50)
        puts "Fetching user albums"
        Spotify::Api::AlbumList.from_json(
          ::Spotify::Api::Base.get("me/albums?offset=#{offset}&limit=#{limit}")
        ).albums
      end
    end
  end
end
