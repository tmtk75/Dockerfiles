run: td_recv

clean: rm_td_recv rm_td_send

distclean: clean rmi_recv rmi_send

rm_td_recv:
	if docker ps -a | egrep "td_recv" > /dev/null; then docker rm -f td_recv; fi

rm_td_send:
	if docker ps -a | egrep "td_send" > /dev/null; then docker rm -f td_send; fi

td_recv:
	docker run -name td_recv -h td_recv                                       -i -t -e HOME=/root td-agent:recv /bin/bash

td_send:
	docker run -name td_send -h td_send --link td_recv:td_recv -p 24224:24224 -i -t -e HOME=/root td-agent:send /bin/bash

build: build_base build_recv build_send

build_base:
	docker build -t td-agent .

build_recv:
	docker build -t td-agent:recv recv

build_send:
	docker build -t td-agent:send send

rmi_recv:
	if docker images | egrep "td-agent\s+recv" > /dev/null; then docker rmi td-agent:recv; fi

rmi_send:
	if docker images | egrep "td-agent\s+send" > /dev/null; then docker rmi td-agent:send; fi

rmi: rmi_recv rmi_send

