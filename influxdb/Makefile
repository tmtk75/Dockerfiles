build:
	docker build -t influxdb .

run:
	docker run -d -p 8083:8083 -p 8086:8086 influxdb

natpf:
	VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,8083,,8083"
	VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,8086,,8086"

natpf_clean:
	VBoxManage controlvm "boot2docker-vm" natpf1 delete tcp_8083_8083
	VBoxManage controlvm "boot2docker-vm" natpf1 delete tcp_8086_8086

logs:
	docker logs `docker ps -l -q`

bash:
	docker run -i -t influxdb /bin/bash

stop:
	docker stop `docker ps -l -q`

