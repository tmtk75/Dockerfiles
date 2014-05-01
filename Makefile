build-norikra:
	cd norikra; make build

build-elasticsearch:
	cd td-agent; make build
	cd elasticsearch; make build

clean: rm-all

stop-all:
	docker ps -q -a | xargs docker stop

rm-all: stop-all
	docker ps -q -a | xargs docker rm

list-rules:
	VBoxManage showvminfo boot2docker-vm | egrep 'NIC.*Rule.*:'

