#
# Ref: https://github.com/docker-library/nginx/blob/docker-v1.7.1/Dockerfile#L1
#
FROM centos

RUN curl -OL http://nginx.org/download/nginx-1.7.2.tar.gz
RUN yum install -y tar gcc pcre pcre-devel zlib-devel
RUN tar xfz nginx-1.7.2.tar.gz

WORKDIR nginx-1.7.2
RUN ./configure; make && make install

RUN { \
		echo; \
		echo '# stay in the foreground so Docker has a process to track'; \
		echo 'daemon off;'; \
	} >> /usr/local/nginx/conf/nginx.conf


WORKDIR /usr/local/nginx/html
EXPOSE 80
CMD ["/usr/local/nginx/sbin/nginx"]

