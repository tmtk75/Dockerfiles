curl:
	curl localhost:9200/library/book/_search?q=name:game | jq .

run:
	docker run -d -p 9200:9200 -p 9300:9300 elasticsearch:1.2.0

stop:
	if docker ps | egrep elasticsearch > /dev/null; then docker stop `docker ps | egrep elasticsearch | awk '{print $$1}'`; fi

build:
	docker build -t elasticsearch:1.2.0 .

build-with-rpm:
	docker build -t elasticsearch.rpm ./with-rpm

natpf:
	VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,9200,,9200"

natpf_clean:
	VBoxManage controlvm "boot2docker-vm" natpf1 delete tcp_9200_9200

