# TODO: Write documentation for `Spotify::To::Tidal`
require "./app"
module SpotifyToTidal
  VERSION = "0.1.0"
  begin
    puts App.new([] of Array(String)).run!
  rescue ex : Spotify::Api::SpotifyError
    puts ex.message
  end
end
