#
# Ref: https://github.com/docker-library/nginx/blob/docker-v1.7.1/Dockerfile#L1
#
FROM centos:6.4
RUN yum install -y tar gcc pcre pcre-devel zlib-devel git
RUN yum install -y --enablerepo=centosplus openssl-devel
RUN yum install -y openldap-devel

RUN curl -OL http://nginx.org/download/nginx-1.7.2.tar.gz
RUN tar xfz nginx-1.7.2.tar.gz
RUN git clone --branch master --depth 1 https://github.com/kvspb/nginx-auth-ldap.git  
RUN cd nginx-auth-ldap; git checkout 8f2b5f86f4f992701b3703ddabea50554177706c

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

