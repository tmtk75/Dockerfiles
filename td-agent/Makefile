run: recv

clean: rm_td_recv rm_td_send

rm_td_recv:
	if docker ps -a | grep "td_recv"; then docker rm -f td_recv; fi

rm_td_send:
	if docker ps -a | grep "td_send"; then docker rm -f td_send; fi

recv:
	docker run -name td_recv \
	  -i -t -p 8888:8888 -p 24224:24224 -e HOME=/root td-agent /bin/bash

send:
	docker run -name td_send --link td_recv:td_recv \
	  -i -t -p 9888:8888 -p 34224:24224 -e HOME=/root td-agent /bin/bash

build:
	docker build -t td-agent .

