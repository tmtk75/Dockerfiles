README

This provides some Dockerfiles.


# Getting Started
## MacOSX

Install homebrew.
```
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

Install boot2docker with brew.
```
brew bundle
```

An environment variable.
```
export DOCKER_HOST=tcp://127.0.0.1:4243
```


# VirtualBox port forwading
You may need to run below commond to configure port forwardings of VirtualBox.
```
VBoxManage controlvm "boot2docker-vm" natpf1 ",tcp,127.0.0.1,9200,,9200"
```

Basically each directory has a shell script to do it.

