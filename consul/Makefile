run:
	docker run -h node0 \
	  -p 8500:8500 \
	  -p 8300:8300 \
	  consul:0.2.0 \
	  /usr/local/bin/consul agent \
	  -server \
	  -bootstrap \
	  -dc local \
	  -data-dir /tmp/consul \
	  -config-dir /etc/consul.d/ \
	  -ui-dir=/static \
	  -node=agent-one

bash:
	docker run -i -t -h node0 consul:0.2.0 /bin/bash

build:
	docker build -t consul:0.2.0 .

