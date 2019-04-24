#!/bin/bash

wget http://203.110.209.244:88/rpm/helm-v2.13.1-linux-amd64.tar.gz
tar -xvf helm-v2.13.1-linux-amd64.tar.gz
cp linux-amd64/helm /usr/local/bin
cat > Dockerfile <<EOF
FROM docker.io/hekai/gcr.io_kubernetes-helm_tiller_v2.13.1
MAINTAINER xja <513957882@qq.com>
EOF
docker built -t gcr.io/kubernetes-helm/tiller:v2.13.1 .
helm init
