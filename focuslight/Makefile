#
# https://github.com/focuslight/focuslight
#
host_workdir=`pwd`/focuslight_data
container_workdir=/focuslight
data_container_name=focuslight_data
image_name=focuslight:0.1.4

build:
	docker build -t $(image_name) .
	docker tag $(image_name) tmtk75/$(image_name)

init:
	docker run -v $(host_workdir):$(container_workdir) -w /           $(image_name) new
	docker run -v $(host_workdir):$(container_workdir) -w $(container_workdir) $(image_name) init

focuslight_data:
	docker run -v $(host_workdir):$(container_workdir) --name $(data_container_name) centos /bin/bash

run:
	docker run -d -p 5125:5125 --volumes-from $(data_container_name) $(image_name)

sample:
	curl -d "number=123" localhost:5125/api/service/section/graph

bash:
	docker run -i -t -v /focuslight --volumes-from $(data_container_name) $(image_name) /bin/bash

stop:
	docker stop `docker ps|egrep focuslight|awk '{print $$1}'`

natpf:
	VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,5125,,5125"

natpf_clean:
	VBoxManage controlvm "boot2docker-vm" natpf1 delete tcp_5125_5125

#distclean:
#	docker ps -a -q | xargs docker rm 

