require "webmock/rspec"

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.before do
    token_json = File.read(File.join(Dir.pwd, 'spec', 'fixtures', 'torrent_api_token.json'))
    search_json = File.read(File.join(Dir.pwd, 'spec', 'fixtures', 'torrent_api_search.json'))

    stub_request(:get, "https://torrentapi.org/pubapi_v2.php?get_token=get_token").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'torrentapi.org', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: token_json, headers: {})

    stub_request(:get, "https://torrentapi.org/pubapi_v2.php?app_id=movie-ticket-cli-test&format=json_extended&mode=search&ranked=0&search_string=A%20Boy%20and%20His%20Dog&sort=seeders&token=abcde12345").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'torrentapi.org', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: search_json, headers: {})
  end
end
