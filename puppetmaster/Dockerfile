FROM tmtk75/centos:20140208
MAINTAINER tmtk75
RUN yum update -y
RUN rpm -ivh https://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm
RUN yum install -y puppet-server-3.4.2
CMD [ "service", "puppetmaster", "start" ]

