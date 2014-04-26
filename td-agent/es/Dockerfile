FROM td-agent
RUN yum install -y make gcc libcurl-devel
RUN /usr/lib64/fluent/ruby/bin/gem install fluent-plugin-elasticsearch --no-ri --no-rdoc 
ADD ./td-agent.conf /etc/td-agent/td-agent.conf
ADD ./td-agent /td-agent
