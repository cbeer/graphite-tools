# Utilities for working with graphite / carbon

Calculate the number of bytes a given Carbon retention policy will take

## whisper-calc

```
$ whisper-calc -n 10 -m 100 10s:1d,1m:7d,10m:1y,60m:5y
=> 1.29 GB

$ whisper-calc -n 10 -m 100 10s:1d,1m:1y
=> 5.97 GB
```

## graphite-predict

```
$ curl "http://localhost/render/?from=-7days&target=server.diskspace.root.byte_free&format=json" | graphite-predict
=> server.diskspace.root.byte_free : 2015-07-26 19:59:24 -0700
```