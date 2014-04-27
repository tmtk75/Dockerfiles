# README

# Getting Started
To build requied images, which will build two images taking a few minutes.
```
$ make build
```

## Try to send with fluent-cat
Launch a container.
```
$ make run
[root@476d5e5542d1 /]# /etc/init.d/td-agent start
Starting td-agent:                                         [  OK  ]
```

Send a message.
```
[root@476d5e5542d1 /]# tail -f /var/log/td-agent/td-agent.log &
...
2014-04-26 08:34:55 +0000 [info]: listening fluent socket on 0.0.0.0:24224
2014-04-26 08:34:55 +0000 [info]: listening dRuby uri="druby://127.0.0.1:24230" object="Engine"

[root@476d5e5542d1 /]# echo '{"a":1,"b":2}' | fluent-cat debug.test
[root@476d5e5542d1 /]# 2014-04-26 08:35:28 +0000 debug.test: {"a":1,"b":2}
```

## Two containers
For now, exit the container and clean up the container you ran before next.
```
$ make clean
```

Launch two containers for receiver and sender. Run each command via different terminal.
In td_recv, please run tail.
```
$ make td_recv
[root@d_recv /]# ./td-agent  # will tail -f
...
2014-04-26 12:46:01 +0000 [info]: listening fluent socket on 0.0.0.0:24224
2014-04-26 12:46:01 +0000 [info]: listening dRuby uri="druby://127.0.0.1:24230" object="Engine"

$ make td_send
[root@d_send /]# ./td-agent
```

Send a message.
```
[root@d_send /]# echo '{"a":1}' | fluent-cat -h 127.0.0.1 debug.test
```

You can see the log soon in the tailed log of td_recv terminal.
```
2014-04-26 12:27:04 +0000 debug.test: {"a":1}
```

NOTE: If it doesn't work properly, please confirm that ipaddr of td_recv is 172.17.0.2 with ifconfig.

## Elasticsearch
Exit both of previouse two containers and clean up the containers.
```
$ make clean
```

Open three terminals and run each ones.
```
$ make td_recv
[root@td_recv /]# ./td-agent
[root@td_recv /]# 

$ make td_send
[root@td_send /]# ./td-agent
[root@td_send /]# 

$ make td_es
docker run -d -p 9200:9200 -p 9300:9300 elasticsearch:1.1.1
bbb924c0cd05744500c091889ac6ec96ffebccc2e0c600db98a0df0a38297c2a
```

`make td_es` need a time to launch in order to initialize elasticsearch. `docker logs td_es` is helpful to see if it's finished.

NOTE: This expects td_recv is 172.17.0.2, td_send is 172.17.0.3 and td_es is 172.17.0.4. Please ensure the order to run.

In the terminal where elasticsearch is running, execute next.
```
$ make curl
{
  "status": 404,
  "error": "IndexMissingException[[library] missing]"
}
```

You see 404 because missing data.

In the td_send, run next.
```
$ echo '{"name":"game"}' | fluent-cat es.test
$ echo '{"name":"animal"}' | fluent-cat es.test
```

After a few seconds, retry `make curl`.
```
{
  "hits": {
    "hits": [
      {
        "_source": {
          "name": "game"
        },
        "_score": 0.30685282,
        "_id": "nb4dOWwQRV6t4US7MozDIw",
        "_type": "book",
        "_index": "library"
      }
    ],
    "max_score": 0.30685282,
    "total": 1
  },
  "_shards": {
    "failed": 0,
    "successful": 5,
    "total": 5
  },
  "timed_out": false,
  "took": 24
}
```

You got this :)

