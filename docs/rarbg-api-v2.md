# RARBG API v2

[source](https://rarbg.to/pubapi/apidocs_v2.txt)

* JSON response, by default
* Include `app_id=app-name` in requests

```no-highlight
https://torrentapi.org/pubapi_v2.php
SCHEME: https
HOST: torrentapi.org
PATH: pubapi_v2.php
```

## Token

```no-highlight
get_token=get_token
PARAMS: { get_token: "get_token", app_id: "movie-ticket-cli" }
RESPONSE: {"token":"gxy7od02pj"}
```

Token expires in 15 min. 30 requests per minute, max.

## Search

```no-highlight
mode=search&search_string=Holy%20Mountain&sort=seeders&token=gxy7od02pj&ranked=0&format=json_extended
PARAMS: { mode: "search", search_string: "Holy Mountain", sort: "seeders" }
RESPONSE: {
  "torrent_results": [
    {
      "filename": "The.Holy.Mountain.1973.720p.BluRay.H264.AAC-RARBG",
      "category": "Movies\/x264\/720",
      "download": "magnet:?xt=urn:btih:a3b10f011131dfc0d979df4ae87605dc0005e72f&dn=The.Holy.Mountain.1973.720p.BluRay.H264.AAC-RARBG&tr=http%3A%2F%2Ftracker.trackerfix.com%3A80%2Fannounce&tr=udp%3A%2F%2F9.rarbg.me%3A2710&tr=udp%3A%2F%2F9.rarbg.to%3A2710&tr=udp%3A%2F%2Fopen.demonii.com%3A1337%2Fannounce"
    },
    {
      "filename": "The.Holy.Mountain.1973.1080p.BluRay.H264.AAC-RARBG",
      "category": "Movies\/x264\/1080",
      "download": "magnet:?xt=urn:btih:cbdbf3dfd5f34b1a6945bc5671181576aa9fc361&dn=The.Holy.Mountain.1973.1080p.BluRay.H264.AAC-RARBG&tr=http%3A%2F%2Ftracker.trackerfix.com%3A80%2Fannounce&tr=udp%3A%2F%2F9.rarbg.me%3A2710&tr=udp%3A%2F%2F9.rarbg.to%3A2710&tr=udp%3A%2F%2Fopen.demonii.com%3A1337%2Fannounce"
    },
    {
      "filename": "The.Holy.Mountain.1973.1080p.BluRay.X264-AMIABLE",
      "category": "Movies\/x264\/1080",
      "download": "magnet:?xt=urn:btih:2ffa971cc26ed81403e3d4455673df2f5de8426f&dn=The.Holy.Mountain.1973.1080p.BluRay.X264-AMIABLE&tr=http%3A%2F%2Ftracker.trackerfix.com%3A80%2Fannounce&tr=udp%3A%2F%2F9.rarbg.me%3A2710&tr=udp%3A%2F%2F9.rarbg.to%3A2710&tr=udp%3A%2F%2Fopen.demonii.com%3A1337%2Fannounce"
    },
    {
      "filename": "The.Holy.Mountain.1973.BRRip.XviD.MP3-RARBG",
      "category": "Movies\/XVID",
      "download": "magnet:?xt=urn:btih:17317c4dc08c7af29f6e1014678bd0c3d6ca38e7&dn=The.Holy.Mountain.1973.BRRip.XviD.MP3-RARBG&tr=http%3A%2F%2Ftracker.trackerfix.com%3A80%2Fannounce&tr=udp%3A%2F%2F9.rarbg.me%3A2710&tr=udp%3A%2F%2F9.rarbg.to%3A2710&tr=udp%3A%2F%2Fopen.demonii.com%3A1337%2Fannounce"
    }
  ]
}
```

## Original Document

When querying the api please use the app_id parameter with your app name so we can generate statistics for it.
All responses are in json by default.
Api endpoint is - https://torrentapi.org/pubapi_v2.php

To use this api you will need to first to get yourself a token
get_token=get_token
Tokens automaticly expire in 15 minutes.
The api has a 1req/2s limit.

Listing torrents :
mode=list&token=xxxx

Searching torrents :
mode=search&search_string=Test%20Search&token=xxxx

Searching by imdb :
mode=search&search_imdb=tt123456&token=xxxx

Searching by tvdb :
mode=search&search_tvdb=123456&token=xxxx

Searching by themoviedb :
mode=search&search_themoviedb=123456&token=xxxx

DEPRECATED as of 12.09.2015 Searching by tvrage :
mode=search&search_tvrage=123456&token=xxxx

Category filtering :
You can use both categories from the site and strings to filter by category.
There are 2 categories available in the api by string - tv and movies.
mode=search&search_imdb=tt123456&category=tv&token=xxxx

If you want to filter by categories from the site just append the category parameter which you can see from the search form on https://rarbg.com/torrents.php
mode=search&search_imdb=tt123456&category=18;41&token=xxxx

Limiting :
limit parameter to anything will limit the results to 25,50 or 100. Default is 25
mode=search&search_imdb=tt123456&limit=100&token=xxxx

Sorting :
sort parameter will sort the results by seeders,leechers,last. Default is last uploaded
mode=search&search_imdb=tt123456&sort=last&token=xxxx

Minimum seeders/leechers :
You can specify the minimum amount of seeders and leechers using the min_seeders and min_leechers parameter.
mode=search&search_imdb=tt123456&min_seeders=50&token=xxxx
mode=search&search_imdb=tt123456&min_leechers=50&token=xxxx
mode=search&search_imdb=tt123456&min_seeders=50&min_leechers=50&token=xxxx

Result format :
format parameter will return the results in the requested format - available formats are json and json_extended. Default is json.
format json_extended returns a lot more info about the torrent.
mode=search&search_imdb=tt123456&format=json&token=xxxx

By default the api will return only ranked torrents ( internal ) , scene releases + -rarbg releases + -rartv releases.
If you want other groups included in the results use the ranked parameter with a value of 0 to get them included.
mode=search&search_imdb=tt123456&ranked=0&token=xxxx

All api times are returned in UTC.
All parameters can be mixed together.
