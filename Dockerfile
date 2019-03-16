FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get -y --no-install-recommends install \
    ca-certificates \
    curl \
    git \ 
    python-pygments \
    hugo \
    rsync \
    openssh-client \
 && rm -rf /var/lib/apt/lists/*

RUN useradd -d /home/jenkins -u 1001 -m jenkins -s /bin/bash