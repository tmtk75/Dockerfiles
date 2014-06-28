FROM centos
RUN yum install -y http://ftp.riken.jp/Linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
RUN yum install -y golang
RUN yum install -y git
ENV GOPATH /.go
RUN go get -u github.com/armon/consul-kv
RUN go get -u github.com/hashicorp/envconsul
WORKDIR /.go/src/github.com/hashicorp/envconsul
RUN go build
CMD ["cp", "envconsul", "/target"]

