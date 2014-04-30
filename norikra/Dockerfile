FROM jruby:1.7.12
MAINTAINER tmtk75

RUN gem install norikra -v 0.1.7 --no-ri --no-rdoc

EXPOSE 26571
EXPOSE 26578

CMD ["norikra", "start"]
