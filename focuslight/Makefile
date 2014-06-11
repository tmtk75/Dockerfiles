build:
	docker build -t focuslight .

bash:
	docker run -i -t -p 5125:5125 focuslight /bin/bash

natpf:
	VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,5125,,5125"

natpf_clean:
	VBoxManage controlvm "boot2docker-vm" natpf1 delete tcp_5125_5125

