build:
	docker build -t influxdb .

run:
	docker run -d -p 8083:8083 -p 8086:8086 influxdb

logs:
	docker logs `docker ps -l -q`

bash:
	docker run -i -t influxdb /bin/bash

stop:
	docker stop `docker ps -l -q`

