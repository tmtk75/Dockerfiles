FROM centos
MAINTAINER tmtk75
RUN yum install -y gcc zlib-devel openssl-devel tar
RUN cd /usr/local; curl -OL http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.gz
RUN cd /usr/local; tar xfz ruby-2.1.1.tar.gz
RUN cd /usr/local/ruby-2.1.1; ./configure --prefix=/usr/local; make; make install
RUN gem install bundler --no-ri --no-rdoc

