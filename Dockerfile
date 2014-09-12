FROM ubuntu:14.04
MAINTAINER progrium "progrium@gmail.com"

RUN mkdir /build
ADD ./stack/ /build

# Import SSH settings and ensure correct permissions
ADD ./.ssh/ /root/.ssh/
RUN chown -R root:root /root/.ssh
RUN chmod 700 /root/.ssh
RUN chmod 600 /root/.ssh/*

# Import bazaar settings
ADD ./.bazaar /.bazaar

RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive /build/prepare
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean

