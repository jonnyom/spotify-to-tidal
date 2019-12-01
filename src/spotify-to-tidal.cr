# TODO: Write documentation for `Spotify::To::Tidal`
require "./tidal/api/search"
require "./spotify/api/user"

module SpotifyToTidal
  VERSION = "0.1.0"

  begin
    spotify_albums = Spotify::Api::User.albums
    tidal_artist = Tidal::Api::Search.new(spotify_albums.first.artists.first.name, 25).run
    puts tidal_artist.artists.list.map(&.name)
  rescue ex : Spotify::Api::ForbiddenError
    puts ex.message
  end

end
