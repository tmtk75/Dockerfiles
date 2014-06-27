#
# Ref: https://github.com/docker-library/nginx/blob/docker-v1.7.1/Dockerfile#L1
#
FROM centos
RUN yum update -y

RUN curl -OL http://nginx.org/download/nginx-1.7.2.tar.gz
RUN yum install -y tar gcc pcre pcre-devel zlib-devel
RUN tar xfz nginx-1.7.2.tar.gz

RUN yum install -y git
RUN git clone https://github.com/kvspb/nginx-auth-ldap.git  
RUN yum install -y --enablerepo=centosplus openssl-devel
RUN yum install -y openldap-devel

WORKDIR nginx-1.7.2
RUN ./configure --with-http_ssl_module \
                --add-module=/nginx-auth-ldap; \
     make && make install

RUN { \
		echo; \
		echo '# stay in the foreground so Docker has a process to track'; \
		echo 'daemon off;'; \
	} >> /usr/local/nginx/conf/nginx.conf


WORKDIR /usr/local/nginx/html
EXPOSE 80
CMD ["/usr/local/nginx/sbin/nginx"]

