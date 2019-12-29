#!/bin/bash

echo "Building $1"
cd $1
docker build -t $1 .
docker tag $1 merovex/$1:latest
docker push merovex/$1:latest
