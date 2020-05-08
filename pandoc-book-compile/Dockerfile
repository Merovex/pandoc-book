FROM ubuntu:latest
MAINTAINER Ben Wilson <ben@merovex.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes
ENV GHR_VERSION="0.13.0"

RUN apt-get update -q \
    && apt-get install -qy \
      make \
      wget \
      git \
      curl \
      bash \
      ca-certificates \
      jq \
      zip \
      libfontconfig1 \
      fontconfig

# Install LaTeX
RUN apt-get update -q \
    && apt-get install -qy \
      texlive-latex-base \
      texlive-latex-recommended \
      texlive-luatex \
      texlive-bibtex-extra \
      biber \
      texlive-xetex \
      texlive-fonts-extra
      # texlive-fonts-recommended

RUN rm -rf /var/lib/apt/lists/*
RUN mkdir -p ./cache

# Install all Google Web Fonts
# RUN apt-get install -y git fontconfig
# RUN apt add --no-cache bash curl ncurses coreutils grep
# RUN git clone https://github.com/google/fonts.git
# RUN mkdir -p /usr/share/fonts/truetype/google-fonts/
# RUN find $PWD/fonts/ -name "*.ttf" -exec install -m644 {} /usr/share/fonts/truetype/google-fonts/ \; || return 1
# RUN fc-cache -f -v

# Install Fonts
ADD fonts/* /usr/share/fonts/
RUN fc-cache -fv

# Install Verkilo
ADD pandoc-book.rb /usr/local/bin/

run mkdir -p /usr/local/share/templates
ADD templates /usr/local/share/templates

# Install PANDOC
ARG PANDOC_VERSION=2.6
ADD fetch-pandoc.sh /usr/local/bin/
RUN fetch-pandoc.sh ${PANDOC_VERSION} ./cache/pandoc.deb && \
    dpkg --install ./cache/pandoc.deb && \
    rm -f ./cache/pandoc.deb

# Enable ability to upload multiple artifacts to GitHub Release in parallel
RUN cd /tmp \
  && wget --output-document=ghr.tgz "https://github.com/tcnksm/ghr/releases/download/v${GHR_VERSION}/ghr_v${GHR_VERSION}_linux_amd64.tar.gz" \
  && tar -xvzf ghr.tgz \
  && mv ghr_v${GHR_VERSION}_linux_amd64/ghr /usr/local/bin
RUN rm -rf /tmp/*

# Create Entrypoint for Github Actions
COPY entrypoint.sh /entrypoint.sh
# COPY upload-to-release.sh /usr/local/bin/upload-to-release.sh
RUN chmod 755 /entrypoint.sh
# RUN chmod 755 /usr/local/bin/upload-to-release.sh
ENTRYPOINT ["/entrypoint.sh"]
