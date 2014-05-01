README

This provides some Dockerfiles.

Currently you can do a trial run for:

- elasticsearch thru td-agent
- norikra thru td-agent
- serf
- consul


# Getting Started
## MacOSX

Install homebrew.
```bash
$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

Install boot2docker with brew.
```bash
$ brew bundle
```

An environment variable.
```bash
$ export DOCKER_HOST=tcp://127.0.0.1:4243
```


# VirtualBox port forwading
You may need to run below commond to configure port forwardings of VirtualBox.
```bash
$ VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,9200,,9200"
```

Basically each directory has a shell script to do it.

You can see all rules for port forwarding like:
```bash
$ VBoxManage showvminfo boot2docker-vm | egrep 'NIC.*Rule.*:'
NIC 1 Rule(0):   name = docker, protocol = tcp, host ip = 127.0.0.1, host port = 4243, guest ip = , guest port = 4243
NIC 1 Rule(1):   name = ssh, protocol = tcp, host ip = 127.0.0.1, host port = 2022, guest ip = , guest port = 22
```

You also can delete a rule with a command like:
```bash
$ VBoxManage controlvm boot2docker-vm natpf1 delete tcp_9200_9200
```

