ps:
	docker ps

stop-all:
	docker ps -q -a | xargs docker stop

rm-all:
	docker ps -q -a | xargs docker rm

list-rules:
	VBoxManage showvminfo boot2docker-vm | egrep 'NIC.*Rule.*:'

