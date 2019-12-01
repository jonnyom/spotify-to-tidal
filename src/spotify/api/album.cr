require "./base"
require "./artist"

module Spotify
  module Api
    class Album
      JSON.mapping(
        artists: Array(Spotify::Api::Artist),
        id: String,
        href: String,
      )
    end
  end
end
