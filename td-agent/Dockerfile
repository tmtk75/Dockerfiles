FROM centos

ADD td.repo /etc/yum.repos.d/td.repo
RUN yum update -y
RUN yum install -y td-agent

RUN echo "PATH=/usr/lib64/fluent/ruby/bin:\$PATH" >> /root/.bashrc
 
EXPOSE 8888
EXPOSE 24224
 
MAINTAINER tmtk75 "https://github.com/tmtk75"

