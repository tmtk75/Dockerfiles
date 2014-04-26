README

# Getting Started
## Localhost
Launch a process.
```
$ make build
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
For now, exit the container and clean up the container you ran before.

