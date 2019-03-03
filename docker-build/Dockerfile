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

ARG PANDOC_VERSION=2.6
ADD fetch-pandoc.sh /usr/local/bin/
RUN fetch-pandoc.sh ${PANDOC_VERSION} ./cache/pandoc.deb && \
    dpkg --install ./cache/pandoc.deb && \
    rm -f ./cache/pandoc.deb

RUN wget --output-document=/tmp/kindlegen.tgz http://kindlegen.s3.amazonaws.com/kindlegen_linux_2.6_i386_v2_9.tar.gz
RUN tar xvfz /tmp/kindlegen.tgz -C /tmp
RUN mv /tmp/kindlegen /usr/bin/kindlegen && chown -R root:root /usr/bin
RUN rm -r /tmp/*

RUN wget --output-document=ghr.tar.gz "https://github.com/tcnksm/ghr/releases/download/v${GHR_VERSION}/ghr_v${GHR_VERSION}_linux_amd64.tar.gz" && \
        tar -xvzf ghr.tar.gz && \
        mv ghr_v${GHR_VERSION}_linux_amd64/ghr /usr/local/bin && \
        chown root:root /usr/local/bin/ghr && \
        rm -r \
            ghr.tar.gz \
            ghr_v${GHR_VERSION}_linux_amd64
