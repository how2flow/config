# Dockerfile
FROM ubuntu:latest
LABEL author="Steve Jeong"
LABEL e-mail="steve@how2flow.net"
LABEL version="20230724"

ARG DEBIAN_FRONTEND=noninteractive

# shell: bash
SHELL ["/bin/bash", "-c"]

ENV ID="user" \
  TZ="Asia/Seoul" \
  WGET_FLAG="--no-check-certificate"

# set timezone.
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

USER root
ADD *.sh /
RUN chmod a+x /*.sh
RUN /prefix.sh
