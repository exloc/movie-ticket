require "xmlrpc/client"
require "base64"

class MovieTicket::SubtitlesAPI
  class << self
    def connection
      begin
        connection = new
        yield(connection)
      ensure
        connection.send(:logout)
      end
    end
  end

  attr_reader :api, :server_info, :token, :user_info, :results

  URL = "https://api.opensubtitles.org/xml-rpc"

  METHODS = %w(
    ServerInfo
    LogIn
    LogOut
    SearchSubtitles
    DownloadSubtitles
  )

  def initialize(username = ENV["OPEN_SUBTITLES_USERNAME"] || "", password = ENV["OPEN_SUBTITLES_PASSWORD"] || "")
    @username = username
    @password = password
    @api = XMLRPC::Client.new_from_uri(uri)
    set_user_agent
    # get_server_info
    login
  end

  def get_server_info
    @server_info = api.call("ServerInfo")
  end

  def search(query)
    options = {
      sublanguageid: language,
      query: query
    }
    response = api.call("SearchSubtitles", token, [options])
    return @results = response["data"]
  end

  def download(id)
    response = api.call("DownloadSubtitles", token, [id])
    response["data"].first["data"]
  end

  private
  attr_reader :username, :password

  def uri
    @_uri ||= URI(URL)
  end

  def set_user_agent
    api.http_header_extra = { "User-Agent" => user_agent }
  end

  def user_agent
    ENV["OPEN_SUBTITLES_USER_AGENT"] || "OSTestUserAgentTemp"
  end

  def language
    ENV["OPEN_SUBTITLES_LANGUAGE"] || "eng"
  end

  def md5_password
    return password if password == ""
    md5 = Digest::MD5.new
    md5.update(password)
    md5.hexdigest
  end

  def login
    response = api.call("LogIn", username, md5_password, language, user_agent)
    @token = response["token"]
    return @user_info = response["data"]
  end

  def logout
    return unless token
    response = api.call("LogOut", token)
    return @token = nil if response
  end
end
