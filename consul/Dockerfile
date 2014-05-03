FROM centos
MAINTAINER tmtk75
RUN yum install -y unzip curl ld-linux.so.2
RUN curl -OL https://dl.bintray.com/mitchellh/consul/0.2.0_linux_386.zip
RUN unzip 0.2.0_linux_386.zip
RUN cp consul /usr/local/bin/
RUN chmod +x /usr/local/bin/consul

