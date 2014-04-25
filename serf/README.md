README

Set up 
======
If you don't have vagrant using MacOSX, you can install it with puppet.

    $ bundle install --binstubs --path vendor
    $ sudo ./bin/puppet apply manifests/init.pp
    $ VBoxManage -v; vagrant -v
    4.3.2r90405
    Vagrant 1.3.5

After the installation, launch a VM and log in.

    $ vagrant up --provision
    $ vagrant ssh


Serf cluster
============
Let's say I work on CentOS-6.4.

serf on host OS

    $ curl -LO https://dl.bintray.com/mitchellh/serf/0.3.0_linux_386.zip
    $ unzip 0.3.0_linux_386.zip
    $ ./serf

Build a docker image

    $ sudo docker build -t centos/serf .

Run serf agent on host OS

    $ ./serf agent
    ==> Starting Serf agent...
    ==> Starting Serf agent RPC...
    ==> Serf agent running!
        Node name: 'kii-tools'
        Bind addr: '0.0.0.0:7946'
         RPC addr: '127.0.0.1:7373'
        Encrypted: false
         Snapshot: false
          Profile: lan

    ==> Log data will now stream in as it occurs:

        2013/12/09 10:25:45 [INFO] Serf agent starting
        2013/12/09 10:25:45 [INFO] serf: EventMemberJoin: kii-tools 10.5.224.32
        2013/12/09 10:25:46 [INFO] agent: Received event: member-join


Run serf agent to bind on docker containers

    $ sudo docker run -t -d centos/serf serf agent -join 10.5.224.32:7946
    8a7d032eb5bf9f42b93d914ff0a8aa930f4799e4b9a90a22d9d5807896e91fba


If you use vagrant, launch it up with `--provision` option.

    $ vagrant up --provision
    $ vagrant ssh
    Welcome to your Vagrant-built virtual machine.
    [vagrant@localhost ~]$ ifconfig
    eth0      Link encap:Ethernet  HWaddr 08:00:27:C9:39:9E  
              inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
              inet6 addr: fe80::a00:27ff:fec9:399e/64 Scope:Link
              ...

    $ cd /vagrant
