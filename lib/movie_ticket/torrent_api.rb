require "json"
require "net/http"

class MovieTicket::TorrentAPI
  attr_reader :app_id, :token

  HOST = "torrentapi.org"
  PATH = "pubapi_v2.php"
  URL = "https://#{HOST}/#{PATH}"

  TOKEN_EXPIRY = 900 # seconds (15 minutes)

  def initialize(app_id = "movie-ticket-cli")
    @app_id = app_id
    @token = nil
    @token_created_at = nil
  end

  def search(query)
    uri = uri({ mode: "search", search_string: query, sort: "seeders", ranked: 0 })
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)["torrent_results"]
  end

  private
  attr_reader :token_created_at

  def options
    {
      app_id: app_id,
      token: api_token,
      format: "json_extended"
    }
  end

  def api_token
    if token_created_at && token_created_at < token_invalid_at
      return token
    else
      return get_token
    end
  end

  def token_invalid_at
    Time.now + TOKEN_EXPIRY
  end

  def get_token
    @token_created_at = Time.now
    uri = URI(URL)
    uri.query = URI.encode_www_form({ get_token: "get_token" })
    response = Net::HTTP.get_response(uri)
    @token = JSON.parse(response.body)["token"]
  end

  def uri(params = {})
    params = options.merge(params)
    uri = URI(URL)
    uri.query = URI.encode_www_form(params)
    uri
  end
end
