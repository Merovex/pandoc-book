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

# Install Scripts
ADD ./scripts/pandoc-book.rb /usr/local/bin/
ADD ./scripts/upload-build.sh /usr/local/bin/
ADD ./scripts/fetch-pandoc.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/*.*
COPY ./scripts/entrypoint.sh /entrypoint.sh

# Install Templates
RUN mkdir -p /usr/local/share/templates
ADD templates /usr/local/share/templates

# Install PANDOC
ARG PANDOC_VERSION=2.9.2.1

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
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
