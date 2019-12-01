require "./base"

module Spotify
  module Api
    class Artist
      JSON.mapping(
        id: String,
        href: String,
        name: String,
      )
    end
  end
end
