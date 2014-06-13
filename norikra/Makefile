version=1.0.0

build:
	docker build -t norikra:$(version) .

run:
	docker run -d -p 26571:26571 -p 26578:26578 norikra:$(version)

stop:
	if docker ps | grep norikra:$(version) >/dev/null; then docker ps | grep norikra:$(version) | awk '{print $$1}' | xargs docker stop; fi

# NAT port forwardings
natpf:
	VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,26571,,26571"
	VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,26578,,26578"

natpf_clean:
	VBoxManage controlvm "boot2docker-vm" natpf1 delete tcp_26571_26571
	VBoxManage controlvm "boot2docker-vm" natpf1 delete tcp_26578_26578

build-client:
	docker build -t norikra-client:1.0.0 client

run-client:
	docker run -i -t norikra-client:1.0.0 /bin/bash

