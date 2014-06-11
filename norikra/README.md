# README

# Getting Started
## Build & Run

```
$ make build
...
Successfully built 5734cc4fa5d0

$ make run
docker run -d -p 26571:26571 -p 26578:26578 norikra:1.0.0
aaa8671f7c01a3189007ac39fe58dd0181d0bcfd44dd85123385263404ea7591
```

Wait for about 30 seconds.
```
$ open http://localhost:26578
```

You can see a web console.


## Client

It's easy to operate Norikra if you have its client command.
Let's say you have a runtime of ruby 1.9.3 or later. You can type to install it.
```
$ gem install norikra-client --no-ri --no-rdoc
```
NOTE: The server requires JRuby but it's better to use CRuby for client command.


## Check if it works well
And The following part is completely a part of Norikra's pages, here <http://norikra.github.io/>.

Add a query to count top-page `/` access.
```
norikra-client query add www.toppageviews \
  'SELECT count(*) AS cnt FROM www.win:time_batch(10 sec) WHERE path="/" AND status=200'
```
`www` after `FROM` is called `target`, which is not the part of `www.toppageviews`. `www.toppageviews` is just a name.

You can see an entry in Queries of the console if you reload the console on your browser.


After that, send next four events which contains one event having top-page path `"path":"/"`.

```
echo '{"path":"/", "status":200, "referer":"", "agent":"MSIE", "userid":3}' | norikra-client event send www
echo '{"path":"/login", "status":301, "referer":"/", "agent":"MSIE", "userid":3}' | norikra-client event send www
echo '{"path":"/content", "status":200, "referer":"/login", "agent":"MSIE", "userid":3}' | norikra-client event send www
echo '{"path":"/page/1", "status":200, "referer":"/content", "agent":"MSIE", "userid":3}' | norikra-client event send www
```

If you reload the page, `Data` section is changed like `EVENTS PROCESSED: 4`.

Lastly, you can execute `fetch`.

```
$ norikra-client event fetch www.toppageviews
{"time":"2014/04/29 16:19:10","cnt":1}
{"time":"2014/04/29 16:19:20","cnt":0}
```

It says a report for the query.

