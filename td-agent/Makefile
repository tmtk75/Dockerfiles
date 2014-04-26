run: recv

recv:
	docker run -i -t -p 8888:8888 -p 24224:24224 -e HOME=/root td-agent /bin/bash

send:
	docker run -i -t -p 8888:8888 -p 34224:24224 -e HOME=/root td-agent /bin/bash

build:
	docker build -t td-agent .
