FROM ubuntu:latest
MAINTAINER Ben Wilson <ben@merovex.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update -q \
    && apt-get install -qy \
      curl \
      ruby \
      git

RUN rm -rf /var/lib/apt/lists/*
RUN mkdir -p ./cache

COPY readme.rb /readme.rb
COPY entrypoint.sh /entrypoint.sh
COPY .README-template.md /.README-template.md
ENTRYPOINT ["/entrypoint.sh"]
