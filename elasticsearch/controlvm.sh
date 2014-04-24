#!/usr/bin/env bash
#
# If you use boot2docker, you have to configure the vm for port forwrading.
#
VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,9200,,9200"

