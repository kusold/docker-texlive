ARG DEBIAN_FRONTEND=noninteractive
FROM ubuntu:bionic

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y wget lsb-release && \
  wget https://github.com/scottkosty/install-tl-ubuntu/raw/master/install-tl-ubuntu && \
  chmod +x ./install-tl-ubuntu && \
  ./install-tl-ubuntu --more-te && \
  rm -rf /var/lib/apt/lists/*

ENV PATH="/opt/texbin:${PATH}"
WORKDIR /data
VOLUME ["/data"]
