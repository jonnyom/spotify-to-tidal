require "json"
require "./artist"

module Tidal
  module Models
    class Album
      JSON.mapping(
        id: Int32,
        title: String,
        duration: Int32,
        numberOfTracks: Int32,
        numberOfVideos: Int32,
        numberOfVolumes: Int32,
        releaseDate: String,
        copyright: String,
        type: String,
        url: { type: String, nilable: true },
        artists: Array(Artist),
      )
    end
  end
end
