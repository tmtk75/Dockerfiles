README

Prepare
```
$ docker build -t consul:0.1.0 .

$ docker run -i -t -h node0 consul:0.1.0 /bin/bash
[node0]$ consul agent -server -bootstrap -data-dir /tmp/consul -node n0

$ docker run -i -t -h node1 consul:0.1.0 /bin/bash
[node1]$ consul agent -data-dir /tmp/consul -node n1

$ docker run -i -t -h node2 consul:0.1.0 /bin/bash
[node2]$ consul agent -data-dir /tmp/consul -node n2
```

Join
```
CTRL+Z
[node0]$ bg
[node0]$ consul members
    2014/04/26 05:18:52 [INFO] agent.rpc: Accepted client: 127.0.0.1:39364
n0  172.17.0.3:8301  alive  role=consul,dc=dc1,vsn=1,vsn_min=1,vsn_max=1,port=8300,bootstrap=1

[node0]$ consul join 172.17.0.4
    2014/04/26 05:19:52 [INFO] agent.rpc: Accepted client: 127.0.0.1:39368
    2014/04/26 05:19:52 [INFO] agent: (LAN) joining: [172.17.0.4]
    2014/04/26 05:19:52 [INFO] serf: EventMemberJoin: n1 172.17.0.4
    2014/04/26 05:19:52 [INFO] agent: (LAN) joined: 1 Err: <nil>
    2014/04/26 05:19:52 [INFO] consul: member 'n1' joined, marking health alive
Successfully joined cluster by contacting 1 nodes.
```

Members again
```
bash-4.1# consul members
    2014/04/26 05:20:14 [INFO] agent.rpc: Accepted client: 127.0.0.1:39374
n0  172.17.0.3:8301  alive  role=consul,dc=dc1,vsn=1,vsn_min=1,vsn_max=1,port=8300,bootstrap=1
n1  172.17.0.4:8301  alive  role=node,dc=dc1,vsn=1,vsn_min=1,vsn_max=1
```

