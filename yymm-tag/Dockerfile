FROM ubuntu:latest
MAINTAINER Ben Wilson <ben@merovex.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update -q \
    && apt-get install -qy \
      curl \
      git

RUN rm -rf /var/lib/apt/lists/*
RUN mkdir -p ./cache

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
