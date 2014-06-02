FROM centos
RUN yum install -y unzip curl
RUN curl -LO https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.0.zip
RUN unzip elasticsearch-1.2.0.zip
RUN yum install -y which java-1.7.0-openjdk
EXPOSE 9200
EXPOSE 9300
CMD ["/elasticsearch-1.2.0/bin/elasticsearch"]
MAINTAINER tmtk75
