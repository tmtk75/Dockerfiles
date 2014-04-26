#!/usr/bin/env bash
#
# If you use boot2docker, you have to configure the vm for port forwrading.
#
VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,24224,,24224"
#VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,8888,,8888"
VBoxManage controlvm "boot2docker-vm" natpf1 ",udp,127.0.0.1,24224,,24224"
#VBoxManage controlvm "boot2docker-vm" natpf1 ",udp,127.0.0.1,8888,,8888"

