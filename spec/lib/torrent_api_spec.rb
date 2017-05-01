RSpec.describe MovieTicket::TorrentAPI do
  let(:app_name) { "movie-ticket-cli-test" }
  let(:api) { MovieTicket::TorrentAPI.new(app_name) }

  describe "#api_token" do
    it "retrieves a token from the API" do
      expect(api.token).to be_nil
      api.send(:api_token)  # call private method
      expect(api.token).to eq("abcde12345")
    end
  end

  describe "#search" do
    it "returns a list of results" do
      results = api.search("A Boy and His Dog")
      expect(results).to_not be_nil
      expect(results.first["title"]).to include("A.Boy.and.His.Dog.1975")
    end
  end
end
