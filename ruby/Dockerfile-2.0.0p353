FROM centos
RUN yum install -y gcc 
RUN yum install -y zlib-devel openssl-devel
RUN cd /usr/local; curl -OL http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p353.tar.gz
RUN cd /usr/local; tar xfz ruby-2.0.0-p353.tar.gz
RUN cd /usr/local/ruby-2.0.0-p353; ./configure --prefix=/usr/local; make; make install
RUN gem install bundler --no-ri --no-rdoc

