README

# Getting Started
To build images.
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
For now, exit the container and clean up the container you ran before.
```
$ make clean
```

Launch two containers for receiver and sender. Run each command via different terminal.
In td_recv, please run tail.
```
$ make td_recv
[root@d_recv /]# /etc/init.d/td-agent start
[root@d_recv /]# tail -f /var/log/td-agent/td-agent.log

$ make td_send
[root@d_send /]# /etc/init.d/td-agent start
```

NOTE: Please confirm that ipaddr of td_recv is 172.17.0.2 with ifconfig.

Send a message.
```
[root@d_send /]# echo '{"a":1}' | fluent-cat -h 127.0.0.1 debug.test
```

You can see the log soon in the tailed log.
```
2014-04-26 12:27:04 +0000 debug.test: {"a":1}
```
