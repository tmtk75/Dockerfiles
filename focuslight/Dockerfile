FROM ruby:2.1.1
MAINTAINER tmtk75

##
## official instruction
##
RUN rpm -ivh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y rrdtool rrdtool-devel
RUN yum install -y sqlite-devel
RUN yum install -y mysql-devel
RUN gem install focuslight --no-ri --no-rdoc

##
## Replace RRDTool-1.3.8 with 1.4.7 which supports --border option
##
RUN curl -OL http://pkgs.repoforge.org/rrdtool/perl-rrdtool-1.4.7-1.el6.rfx.x86_64.rpm
RUN curl -OL http://pkgs.repoforge.org/rrdtool/rrdtool-devel-1.4.7-1.el6.rfx.x86_64.rpm
RUN curl -OL http://pkgs.repoforge.org/rrdtool/rrdtool-1.4.7-1.el6.rfx.x86_64.rpm
RUN yum install -y libdbi ruby xorg-x11-fonts-Type1 gettext
RUN yum install -y perl-Time-HiRes perl-Digest-SHA
RUN yum erase rrdtool -y
RUN rpm -Uvh perl-rrdtool-1.4.7-1.el6.rfx.x86_64.rpm rrdtool-1.4.7-1.el6.rfx.x86_64.rpm rrdtool-devel-1.4.7-1.el6.rfx.x86_64.rpm

##
## initialize
##
RUN focuslight new
WORKDIR focuslight
RUN focuslight init
CMD focuslight start

EXPOSE 5125

