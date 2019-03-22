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

# Install all Google Web Fonts
RUN apt-get install -y git fontconfig
RUN git clone https://github.com/google/fonts.git
# RUN hg clone https://googlefontdirectory.googlecode.com/hg/ fonts
RUN mkdir -p /usr/share/fonts/truetype/google-fonts/
RUN find $PWD/fonts/ -name "*.ttf" -exec install -m644 {} /usr/share/fonts/truetype/google-fonts/ \; || return 1
RUN fc-cache -f -v

ARG PANDOC_VERSION=2.6
ADD fetch-pandoc.sh /usr/local/bin/
RUN fetch-pandoc.sh ${PANDOC_VERSION} ./cache/pandoc.deb && \
    dpkg --install ./cache/pandoc.deb && \
    rm -f ./cache/pandoc.deb

RUN cd /tmp \
  && wget --output-document=ghr.tgz "https://github.com/tcnksm/ghr/releases/download/v${GHR_VERSION}/ghr_v${GHR_VERSION}_linux_amd64.tar.gz" \
  && tar -xvzf ghr.tgz \
  && mv ghr_v${GHR_VERSION}_linux_amd64/ghr /usr/local/bin
  # && chown root:root /usr/local/bin
RUN rm -rf /tmp/*
