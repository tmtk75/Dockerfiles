#
# data_container: focuslight_data
# volumes: ["/focuslight"]
#
build:
	docker build -t focuslight:0.1.4 .

focuslight_data:
	docker run -v `pwd`/focuslight_data:/focuslight --name focuslight_data centos /bin/bash

init:
	docker run -v `pwd`/focuslight_data:/focuslight -w / focuslight:0.1.4 focuslight new
	docker run -v `pwd`/focuslight_data:/focuslight -w /focuslight focuslight:0.1.4 focuslight init

run:
	docker run -d -p 5125:5125 -v /focuslight --volumes-from focuslight_data focuslight:0.1.4 focuslight start

sample:
	curl -d "number=123" localhost:5125/api/service/section/graph


bash:
	docker run -i -t -v /focuslight --volumes-from focuslight_data focuslight:0.1.4 /bin/bash

stop:
	docker stop `docker ps|egrep focuslight|awk '{print $$1}'`

natpf:
	VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,5125,,5125"

natpf_clean:
	VBoxManage controlvm "boot2docker-vm" natpf1 delete tcp_5125_5125

#distclean:
#	docker ps -a -q | xargs docker rm 

