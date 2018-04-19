FROM  microsoft/azure-cli:latest
MAINTAINER furuyamah <furuyamah@isao.co.jp>

WORKDIR /root/

RUN apk update  \
    && apk upgrade  \
    && apk add docker --no-cache \
    && az aks install-cli

# set up helm
ENV HELM_FILE helm-v2.9.0-rc3-linux-amd64.tar.gz
RUN wget https://storage.googleapis.com/kubernetes-helm/$HELM_FILE \
    && tar xvfz ./$HELM_FILE \
    && cp ./linux-amd64/helm /usr/local/bin/ \
    && rm -f ./$HELM_FILE \
    && rm -rf ./linux-amd64

ENTRYPOINT bash
