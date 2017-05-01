# Movie Ticket

Query [torrentapi.org](https://torrentapi.org) for torrents. Query [OpenSubtitles.org](http://trac.opensubtitles.org/projects/opensubtitles/wiki) for corresponding subtitles.


## Features

* [x] query api for movie torrents
* [x] download torrent to watch directory
* [x] download srt subtitles


## Usage

```bash
$ git clone movie-ticket-cli  # clone it
$ cd movie-ticket-cli
$ bundle  # download dependencies

# configuration: location your torrent client looks for .torrent/.magnet files
$ echo 'export WATCH_DIR=/Users/username/torrents' > .env

# configuration: location to store your subtitles
$ echo 'export DOWNLOAD_DIR=/Users/username/Downloads' >> .env

# set OPEN_SUBTITLES_USERNAME and OPEN_SUBTITLES_PASSWORD if you're going to be using this a lot
$ source .env  # load config

# retrieve first magnet link & subtitles that match the search query (sorted by seeders, desc)
$ ./exe/movie_ticket Holy Mountain
```
