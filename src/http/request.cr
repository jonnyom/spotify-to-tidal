require "http"

module Http
  class Request

    def self.make_request(url, authentication, method, body = nil)
      headers = headers(authentication)
      puts url
      puts method
      puts body
      return HTTP::Client.post(url, headers: headers, form: body) if method == "POST" && body.is_a?(HTTP::FormData)
      HTTP::Client.exec(method, url, headers)
    end

    private def self.headers(authentication)
      HTTP::Headers{
        "authorization" => "Bearer #{authentication}"
      }
    end
  end
end
