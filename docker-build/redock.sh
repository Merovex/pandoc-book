#!/bin/sh -eux

TAG=$1

docker tag ${TAG} merovex/pandoc:latest
docker push merovex/pandoc:latest
