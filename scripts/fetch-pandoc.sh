#!/bin/sh -eux

PANDOC_VERSION=$1
DEST=${2-pandoc.deb}
#   https://github.com/jgm/pandoc/releases/download/2.6/pandoc-2.6-1-amd64.deb
URL=https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-amd64.deb

exec wget --continue --output-document ${DEST} ${URL}
