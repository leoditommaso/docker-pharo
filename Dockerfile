FROM ubuntu:precise

MAINTAINER Leandro Di Tommaso <leandro.ditommaso@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && \
    apt-get install --no-install-recommends -qy \
                        curl \
                        ia32-libs \
                        unzip

# Container cleanup.
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /data
RUN cd /data && curl get.pharo.org | bash

WORKDIR /data
VOLUME ["/data"]
