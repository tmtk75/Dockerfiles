#
# OSX:8080 --> boot2docker:80 --> container:80
#
target:
	echo "hi"

build:
	docker build -t tmtk75/nginx:1.7.2 .

run:
	docker run -p 80:80 nginx

# NAT port forwardings
natpf:
	VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,8080,,80"

natpf_clean:
	VBoxManage controlvm "boot2docker-vm" natpf1 delete tcp_8080_80

