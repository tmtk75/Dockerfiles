FROM centos
ADD ./es.repo /etc/yum.repos.d/es.repo
RUN yum install -y elasticsearch
RUN yum install -y which java-1.7.0-openjdk
RUN /usr/share/elasticsearch/bin/plugin --install mobz/elasticsearch-head
RUN /usr/share/elasticsearch/bin/plugin --install royrusso/elasticsearch-HQ
EXPOSE 9200
EXPOSE 9300

