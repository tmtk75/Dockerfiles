FROM tmtk75/ruby:2.0.0-p353
RUN cd /usr/local; curl -OL http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz
RUN cd /usr/local; tar xfz ruby-2.1.0.tar.gz
RUN cd /usr/local/ruby-2.1.0; ./configure --prefix=/usr/local; make; make install
RUN gem install bundler --no-ri --no-rdoc

