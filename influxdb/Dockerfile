# - * - dockerfile - * -
FROM centos
RUN yum install -y sudo
RUN curl -OL http://s3.amazonaws.com/influxdb/influxdb-latest-1.x86_64.rpm
RUN useradd influxdb
RUN rpm -ivh influxdb-latest-1.x86_64.rpm
#EXPOSE 8086 8083 8090 8099
RUN sed -i -r -e "s/(^Defaults\s+requiretty)/#\1/" /etc/sudoers
CMD /etc/init.d/influxdb start && /usr/bin/tail -f /opt/influxdb/shared/log.txt

