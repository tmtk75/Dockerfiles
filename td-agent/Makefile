usage:
	echo see README

monitor_json:
	curl http://localhost:24220/api/plugins.json | jq .

monitor_ltsv:
	curl http://localhost:24220/api/plugins

curl:
	cd ../elasticsearch; make curl

run: td_recv

clean: rm

distclean: clean rmi-all

rm: rm_es rm_send rm_recv

rm_recv:
	if docker ps -a | egrep "td-agent:recv" > /dev/null; then docker rm -f td_recv; fi

rm_send:
	if docker ps -a | egrep "td-agent:send" > /dev/null; then docker rm -f td_send; fi

rm_es:
	if docker ps -a | egrep "\s+td_es" > /dev/null; then docker rm -f td_es; fi

td_recv:
	docker run -name td_recv -h td_recv                        -p 24220:24220 -i -t -e HOME=/root td-agent:recv /bin/bash

td_send:
	docker run -name td_send -h td_send --link td_recv:td_recv -p 24224:24224 -i -t -e HOME=/root td-agent:send /bin/bash

td_es:
	docker run -name td_es -h td_es -p 9200:9200 -p 9300:9300 elasticsearch:1.1.1 &

build: build_base build_recv build_send

build_base:
	docker build -t td-agent:base .

build_recv:
	docker build -t td-agent:recv recv

build_send:
	docker build -t td-agent:send send

rmi_base:
	if docker images | egrep "td-agent\s+base" > /dev/null; then docker rmi td-agent:base; fi

rmi_recv: rm_recv
	if docker images | egrep "td-agent\s+recv" > /dev/null; then docker rmi td-agent:recv; fi

rmi_send: rm_send
	if docker images | egrep "td-agent\s+send" > /dev/null; then docker rmi td-agent:send; fi

rmi: rmi_recv rmi_send

rmi-all: rmi rmi_base

natpf:
	VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,24224,,24224"
	VBoxManage controlvm "boot2docker-vm" natpf1 ",udp,127.0.0.1,24224,,24224"
	VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,24220,,24220"

natpf_clean:
	VBoxManage controlvm "boot2docker-vm" natpf1 delete tcp_24224_24224
	VBoxManage controlvm "boot2docker-vm" natpf1 delete udp_24224_24224
	VBoxManage controlvm "boot2docker-vm" natpf1 delete tcp_24220_24220

