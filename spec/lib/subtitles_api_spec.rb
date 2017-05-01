require "pry"

RSpec.describe MovieTicket::SubtitlesAPI do
  let(:query) { "Zero.Dark.Thirty.2012.DVDRip.XVID-DEPRiVED" }
  let(:api) { MovieTicket::SubtitlesAPI.new("", "") }

  describe "#new" do
    it "sets the token on creation" do
      expect(api.token).to_not be_nil
    end
  end

  describe "#logout" do
    before { api.send(:logout) }

    it "removes the token" do
      expect(api.token).to be_nil
    end
  end
end
