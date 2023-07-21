# Dockerfile
FROM ubuntu:focal
LABEL author="Steve Jeong"
LABEL e-mail="steve@how2flow.net"
LABEL version="3.0.1"

ARG DEBIAN_FRONTEND=noninteractive

# shell: bash
SHELL ["/bin/bash", "-c"]

ENV ID="user" \
  TZ="Asia/Seoul" \
  WGET_FLAG="--no-check-certificate"

# set timezone.
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

USER root
WORKDIR /root
COPY fixups fixups
RUN chmod -R +x fixups
RUN ./fixups/prefix
