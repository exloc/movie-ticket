# Movie Ticket

Query rarbg API for torrents.

* [x] query api for movie torrents
* [x] download torrent to watch directory
* [-] start torrent download (responsibility of torrent app)
* [ ] download srt subtitles
* [ ] growl notification when download is complete (based on file size)


## Usage

```no-highlight
$ git clone movie-ticket-cli
$ cd movie-ticket-cli
$ bundle
$ echo 'WATCH_DIR="/Users/username/torrents"' > .env
$ ./exe/movie_ticket Holy Mountain
```
