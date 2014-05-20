run:
	docker run -h node0 \
	  -p 8500:8500 \
	  -p 8300:8300 \
	  consul:0.2.0 \
	  /usr/local/bin/consul agent \
	  -server -bootstrap -dc local \
	  -data-dir /tmp/consul \
	  -config-dir /etc/consul.d/ \
	  -ui-dir . \
	  -client 0.0.0.0 \
	  -node agent-one

bash:
	docker run -i -t -h node0 consul:0.2.0 /bin/bash

build:
	docker build -t consul:0.2.0 .

local-install:
	curl -OL https://dl.bintray.com/mitchellh/consul/0.2.0_linux_386.zip
	unzip -o 0.2.0_linux_386.zip
	chmod +x ./consul
	curl -OL https://dl.bintray.com/mitchellh/consul/0.2.0_web_ui.zip
	unzip -o 0.2.0_web_ui.zip

local-run:
	./consul agent \
	  -server -bootstrap -dc local \
	  -data-dir ./tmp \
	  -config-dir . \
	  -ui-dir=. \
	  -node agent-one \
	  -client 0.0.0.0
