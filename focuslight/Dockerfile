FROM ruby:2.1.1
MAINTAINER tmtk75
RUN rpm -ivh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y rrdtool rrdtool-devel
RUN yum install -y sqlite-devel
RUN yum install -y mysql-devel
RUN gem install focuslight --no-ri --no-rdoc

