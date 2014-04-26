README

# Getting Started
Please run below comman once to build an image for serf.
```
make build
```

- Open three terminals
- Run new container in each terminal with below commands

```
bash-4.1# serf -discover c0               -event-handler query=cat
bash-4.1# serf -discover c0 -tag role=web -event-handler query:cat=cat
bash-4.1# serf -discover c0 -tag role=db  -event-handler query:echo=echo
```

- For `query:cat`, this event handler runs `cat` for `query` event.
- For `query:cat=cat`, this event handler runs `cat` command in case event is `query` and the name is `cat`.
- For `query:echo=echo`, this event handler runs `echo` command in case event is `query` and the name is `echo`.


In the first terminal,
```
bash-4.1# serf members
    2014/04/26 04:43:35 [INFO] agent.ipc: Accepted client: 127.0.0.1:48854
5da781e98ce0  172.17.0.4:7946  alive  
482277166dd4  172.17.0.6:7946  alive  role=db
16f83f559b87  172.17.0.3:7946  alive  role=web
```

Try some query commands.
```
bash-4.1# serf query test hello
    2014/04/26 04:53:29 [INFO] agent.ipc: Accepted client: 127.0.0.1:48932
    2014/04/26 04:53:29 [INFO] agent: Received event: query: test
Query 'test' dispatched
Ack from '5da781e98ce0'
Response from '5da781e98ce0': hello
Ack from '482277166dd4'
Ack from '16f83f559b87'
Total Acks: 3
Total Responses: 1
```
If event name is `test`, one node responds.

```
bash-4.1# serf query cat hello
    2014/04/26 04:53:41 [INFO] agent.ipc: Accepted client: 127.0.0.1:48934
    2014/04/26 04:53:41 [INFO] agent: Received event: query: cat
Query 'cat' dispatched
Ack from '5da781e98ce0'
Response from '5da781e98ce0': hello
Ack from '482277166dd4'
Ack from '16f83f559b87'
Response from '16f83f559b87': hello
Total Acks: 3
Total Responses: 2
```
If event name is `cat`, two nodes respond.

You may already understand?

