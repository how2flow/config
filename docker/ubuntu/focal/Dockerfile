# Dockerfile
FROM ubuntu:focal
LABEL author="Steve Jeong"
LABEL e-mail="steve@how2flow.net"
LABEL version="20231219"

ARG DEBIAN_FRONTEND=noninteractive

# shell: bash
SHELL ["/bin/bash", "-c"]

ENV ID="user" \
  TZ="Asia/Seoul" \
  WGET_FLAG="--no-check-certificate"

# set timezone.
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

USER root
ADD fixups/*.sh /
RUN chmod a+x /*.sh
RUN /prefix.sh
