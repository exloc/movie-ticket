require "dotenv"
Dotenv.load

module MovieTicket
  # http://stackoverflow.com/a/10133837/2675670
  def self.root
    File.dirname(__dir__)
  end

  autoload :SubtitlesAPI, "#{root}/lib/movie_ticket/subtitles_api"
  autoload :TorrentAPI, "#{root}/lib/movie_ticket/torrent_api"
end
