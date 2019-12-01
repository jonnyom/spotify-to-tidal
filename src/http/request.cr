require "http/client"
require "http/headers"

module Http
  class Request

    def self.make_request(url, authentication, method)
      headers = headers(authentication)
      HTTP::Client.exec(method, url, headers)
    end

    private def self.headers(authentication)
      HTTP::Headers{
        "authorization" => "Bearer #{authentication}"
      }
    end
  end
end
