require "../models/artist_list"
require "../models/album_list"
require "./base"

module Tidal
  module Api
    class Search < Tidal::Api::Base

      getter query : String
      property limit

      ENDPOINT = "search"

      def initialize(@query : String, @limit : Int32); end

      def run
        Response.from_json(Tidal::Api::Base.get(ENDPOINT, additional_query_params: query_params))
      end

      private def query_params
        {
          "query" => URI.encode(query),
          "limit" => limit.to_s,
          "offset" => "0",
          "types" => "ARTISTS,ALBUMS,TRACKS,VIDEOS,PLAYLISTS",
          "includeContributers" => "true"
        }
      end

      class Response
        JSON.mapping(
          artists: Tidal::Models::ArtistList,
          albums: Tidal::Models::AlbumList,
        )
      end
    end
  end
end
