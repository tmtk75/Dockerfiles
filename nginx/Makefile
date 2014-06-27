#
# OSX:8080 --> boot2docker:80 --> container:80
#
target:
	echo "hi"

IMAGE=tmtk75/nginx:1.7.2 

build:
	docker build -t $(IMAGE) .

run:
	docker run \
		-p 8080:80 \
		-v `pwd`/nginx.conf:/usr/local/nginx/conf/nginx.conf \
		$(IMAGE)

bash:
	docker run -i -t $(IMAGE) /bin/bash

sample:
	curl -v localhost:8080/index.html

# NAT port forwardings
natpf:
	VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,8080,,80"

natpf_clean:
	VBoxManage controlvm "boot2docker-vm" natpf1 delete tcp_8080_80

