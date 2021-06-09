FROM debian:latest AS base
LABEL author="ReadTeam"
LABEL description="Simple Read Team Image"
ENV WORKDIR_ENV=/readteam
ENV TOR_LATEST_VERSION="0.4.5.8"
WORKDIR ${WORKDIR_ENV}
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get -y install \ 
    net-tools \
    netcat \
    python3 \
    python3-dev \
    python3-pip \
    unzip \
    wget \
    curl \
    git \
    gcc \
    libc-dev \
    libxslt-dev \
    libssl-dev \
    zlib1g \
    zlib1g-dev \
    firefox-esr \
    xfce4-terminal \
    autoconf \
    automake \
    libtool \
    apt-utils \
    openssh-server \
    openssl \
    build-essential \
    libpcap-dev \
    libsqlite3-dev \
    libsqlite3-0 \
    libevent-dev       # Require Tor Configure Event  

# Delete CD ${WORKDIR} && and Test
# Install Repositories of Required Tools
RUN git clone https://github.com/lanmaster53/recon-ng.git
RUN git clone https://github.com/s0md3v/Photon.git
RUN git clone https://github.com/laramies/theHarvester.git
RUN git clone https://github.com/Mr-Un1k0d3r/MaliciousMacroGenerator.git
RUN git clone https://github.com/dgoulet/torsocks.git

## Install TOR_LATEST_VERSION 
RUN wget https://dist.torproject.org/tor-${TOR_LATEST_VERSION}.tar.gz && \
    tar -xvf tor-${TOR_LATEST_VERSION}.tar.gz && \
    rm tor-${TOR_LATEST_VERSION}.tar.gz && \
    mv tor-${TOR_LATEST_VERSION} tor_latest
