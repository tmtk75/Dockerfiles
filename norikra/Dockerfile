FROM centos
MAINTAINER tmtk75

RUN yum install -y tar java-1.7.0-openjdk
ENV JAVA_HOME  /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.55.x86_64/jre

RUN curl -LO http://jruby.org.s3.amazonaws.com/downloads/1.7.10/jruby-bin-1.7.10.tar.gz
RUN tar xfz jruby-bin-1.7.10.tar.gz
ENV PATH /jruby-1.7.10/bin:$PATH

RUN gem install norikra -v 0.1.7 --no-ri --no-rdoc

EXPOSE 26571
EXPOSE 26578

CMD ["norikra", "start"]
