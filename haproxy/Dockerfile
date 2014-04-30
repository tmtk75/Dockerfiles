FROM centos
MAINTAINER tmtk75
RUN yum install -y gcc zlib-devel openssl-devel tar
RUN cd /usr/local; curl -OL http://haproxy.1wt.eu/download/1.4/src/haproxy-1.4.25.tar.gz
RUN cd /usr/local; tar xfz haproxy-1.4.25.tar.gz
RUN cd /usr/local/haproxy-1.4.25 ./configure --prefix=/usr/local; make; make install

