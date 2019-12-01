require "./base"
require "./album_list"

module Spotify
  module Api
    class User
      def self.albums
        Spotify::Api::AlbumList.from_json(::Spotify::Api::Base.get("me/albums")).albums
      end
    end
  end
end
