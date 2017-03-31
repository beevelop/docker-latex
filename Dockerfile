FROM ubuntu:xenial

MAINTAINER Xinjiang Shao <shaoxinjiang at gmail dot com>

ENV DEBIAN_FRONTEND noninteractive

ADD docker-entrypoint.sh /docker-entrypoint.sh

RUN apt-get update -q && \
    apt-get install -y texlive-full biber \
    gnuplot && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /docker-entrypoint.sh

VOLUME /mnt/src

ENTRYPOINT ["/docker-entrypoint.sh"]
