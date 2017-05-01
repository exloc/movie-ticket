require "webmock/rspec"

false ? WebMock.disable! : WebMock.enable!

RSpec.configure do |config|
  config.before do
    token_json = File.read(File.join(Dir.pwd, 'spec', 'fixtures', 'torrent_api_token.json'))
    search_json = File.read(File.join(Dir.pwd, 'spec', 'fixtures', 'torrent_api_search.json'))
    server_info_xml = File.read(File.join(Dir.pwd, 'spec', 'fixtures', 'open-subtitles-server-info.xml'))
    log_in_xml = File.read(File.join(Dir.pwd, 'spec', 'fixtures', 'open-subtitles-log-in.xml'))
    logout_xml = File.read(File.join(Dir.pwd, 'spec', 'fixtures', 'open-subtitles-logout.xml'))

    stub_request(:get, "https://torrentapi.org/pubapi_v2.php?get_token=get_token").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'torrentapi.org', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: token_json, headers: {})

    stub_request(:get, "https://torrentapi.org/pubapi_v2.php?app_id=movie-ticket-cli-test&format=json_extended&mode=search&ranked=0&search_string=A%20Boy%20and%20His%20Dog&sort=seeders&token=abcde12345").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'torrentapi.org', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: search_json, headers: {})

    stub_request(:post, "https://api.opensubtitles.org/xml-rpc").
      with(body: "<?xml version=\"1.0\" ?><methodCall><methodName>ServerInfo</methodName><params/></methodCall>\n",
        headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Connection'=>'keep-alive', 'Content-Type'=>'text/xml; charset=utf-8', 'User-Agent'=>'OSTestUserAgentTemp'}).
      to_return(status: 200, body: server_info_xml, headers: {})

    stub_request(:post, "https://api.opensubtitles.org/xml-rpc").
      with(body: "<?xml version=\"1.0\" ?><methodCall><methodName>LogIn</methodName><params><param><value><string></string></value></param><param><value><string></string></value></param><param><value><string>eng</string></value></param><param><value><string>OSTestUserAgentTemp</string></value></param></params></methodCall>\n",
        headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Connection'=>'keep-alive', 'Content-Type'=>'text/xml; charset=utf-8', 'User-Agent'=>'OSTestUserAgentTemp'}).
      to_return(status: 200, body: log_in_xml, headers: {})

    stub_request(:post, "https://api.opensubtitles.org/xml-rpc").
      with(body: "<?xml version=\"1.0\" ?><methodCall><methodName>LogOut</methodName><params><param><value><string>cyAq0ZsSfC5ScnmfeKS9rFaW1J6</string></value></param></params></methodCall>\n",
        headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Connection'=>'keep-alive', 'Content-Type'=>'text/xml; charset=utf-8', 'User-Agent'=>'OSTestUserAgentTemp'}).
      to_return(status: 200, body: logout_xml, headers: {})
  end
end
