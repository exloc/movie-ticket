# Movie Ticket

Query rarbg API for torrents. Query opensubtitles for corresponding subtitles.

* [x] query api for movie torrents
* [x] download torrent to watch directory
* [-] start torrent download (responsibility of torrent app)
* [ ] download srt subtitles
* [ ] growl notification when download is complete (based on file size)


## Usage

```bash
$ git clone movie-ticket-cli  # clone it
$ cd movie-ticket-cli

$ bundle  # download dependencies

# configuration: location your torrent client looks for .torrent/.magnet files
$ echo 'export WATCH_DIR=/Users/username/torrents' > .env

# configuration: location to store your subtitles
$ echo 'export DOWNLOAD_DIR=/Users/username/Downloads' >> .env

$ source .env  # load config

# retrieve first magnet link that matches the search query (sorted by seeders, desc)
$ ./exe/movie_ticket Holy Mountain
```
