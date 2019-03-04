#!/bin/sh -eux

TAG=$1

docker tag ${TAG} merovex/pandoc-book:latest
docker push merovex/pandoc-book:latest
