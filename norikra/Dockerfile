FROM centos

RUN yum install -y tar java-1.6.0-openjdk
ENV JAVA_HOME  /usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64/jre

RUN curl -OL http://jruby.org.s3.amazonaws.com/downloads/1.7.12/jruby-bin-1.7.12.tar.gz
RUN tar xfz jruby-bin-1.7.12.tar.gz
ENV PATH /jruby-1.7.12/bin:$PATH

RUN gem install norikra -v 0.1.7 --no-ri --no-rdoc

EXPOSE 26571
EXPOSE 26578

CMD ["norikra", "start"]
