README

```
$ docker build -t consul:0.1.0 .

$ docker run -i -t -h node0 consul:0.1.0 /bin/bash
[node0]$ consul agent -server -bootstrap -data-dir /tmp/consul -node n0

$ docker run -i -t -h node1 consul:0.1.0 /bin/bash
[node1]$ consul agent -data-dir /tmp/consul -node n1

$ docker run -i -t -h node2 consul:0.1.0 /bin/bash
[node2]$ consul agent -data-dir /tmp/consul -node n2
```

