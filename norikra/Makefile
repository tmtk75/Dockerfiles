build:
	docker build -t norikra:0.1.7 .

build-client:
	docker build -t norikra-client:0.1.5 client

run:
	docker run -d -p 26571:26571 -p 26578:26578 norikra:0.1.7

# NAT port forwardings
natpf:
	VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,26571,,26571"
	VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,26578,,26578"

natpf_clean:
	VBoxManage controlvm "boot2docker-vm" natpf1 delete tcp_26571_26571
	VBoxManage controlvm "boot2docker-vm" natpf1 delete tcp_26578_26578

