FROM ubuntu:latest
MAINTAINER Ben Wilson <ben@merovex.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes
ENV GHR_VERSION="0.9.0"

RUN apt-get update -q \
    && apt-get install -qy \
      make \
      wget \
      git \
      libfontconfig1 \
      texlive-latex-base \
      texlive-latex-recommended \
      texlive-luatex \
      texlive-xetex \
      texlive-fonts-extra \
      texlive-fonts-recommended

RUN rm -rf /var/lib/apt/lists/*
RUN mkdir -p ./cache
RUN mkdir -p /tmp

ARG PANDOC_VERSION=2.6
ADD fetch-pandoc.sh /usr/local/bin/
RUN fetch-pandoc.sh ${PANDOC_VERSION} ./cache/pandoc.deb && \
    dpkg --install ./cache/pandoc.deb && \
    rm -f ./cache/pandoc.deb

RUN cd /tmp \
  && wget --output-document=/usr/bin/kindlegen https://drive.google.com/open?id=1BPyb8SGqi6s_RLlWm1CAldQLwzmXHJrD \
  && chmod 755 /usr/bin/kindlegen
  #\
#   && tar xvfz kindlegen.tgz -C /tmp \
#   && mv kindlegen /usr/bin/kindlegen \
#   && chown -R root:root /usr/bin
# RUN rm -r /tmp/*

RUN cd /tmp \
  && wget --output-document=ghr.tgz "https://github.com/tcnksm/ghr/releases/download/v${GHR_VERSION}/ghr_v${GHR_VERSION}_linux_amd64.tar.gz" \
  && tar -xvzf ghr.tgz \
  && mv ghr_v${GHR_VERSION}_linux_amd64/ghr /usr/local/bin \
  && chown root:root /usr/local/bin
RUN rm -rf /tmp/*
