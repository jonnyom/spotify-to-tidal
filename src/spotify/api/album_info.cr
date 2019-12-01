require "./base"
require "./album"

module Spotify
  module Api
    class AlbumInfo
      JSON.mapping(added_at: String, album: Album)
    end
  end
end
