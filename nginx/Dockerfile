FROM centos
RUN curl -OL http://nginx.org/download/nginx-1.7.2.tar.gz
RUN yum install -y tar gcc
RUN yum install -y pcre pcre-devel
RUN yum install -y zlib-devel
RUN tar xfz nginx-1.7.2.tar.gz
WORKDIR nginx-1.7.2
RUN ./configure; make && make install

