FROM centos

ADD td.repo /etc/yum.repos.d/td.repo
RUN yum update -y
RUN yum install -y td-agent
 
EXPOSE 8888
EXPOSE 24224
 
MAINTAINER tmtk75 "https://github.com/tmtk75"

