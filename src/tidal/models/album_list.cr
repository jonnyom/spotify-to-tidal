require "json"
require "./album"

module Tidal
  module Models
    class AlbumList
      JSON.mapping(
        limit: Int32,
        offset: Int32,
        totalNumberOfItems: Int32,
        items: Array(Album),
      )
    end
  end
end
