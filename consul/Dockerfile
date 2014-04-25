FROM centos
RUN yum install -y unzip curl ld-linux.so.2
RUN curl -LO https://dl.bintray.com/mitchellh/consul/0.1.0_linux_386.zip
RUN unzip 0.1.0_linux_386.zip
RUN cp consul /usr/local/bin/
MAINTAINER tmtk75

##
## $ docker build -t consul:0.1.0 .
##
