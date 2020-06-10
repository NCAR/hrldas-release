FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive 
ENV DEBIAN_PRIORITY=critical
RUN apt-get update && \
    apt-get install -y \
# general deps \
    curl \
    build-essential \
    make \
    gcc \
# jasper deps \
    cmake \
    automake \
    autoconf \
    libtool \
    m4 \
    pkg-config \
# hlrdas deps \
    libswitch-perl \
    gfortran \
    libnetcdf-dev \
    libnetcdff-dev \
    libjpeg-dev \
    libopenjp2-7-dev \
    libjpeg-turbo8-dev \
    libbz2-dev \
    libgrib2c-dev \
    && apt clean

RUN apt install -y \
    git

VOLUME /src
WORKDIR /tmp
RUN curl -L https://github.com/mdadams/jasper/archive/version-1.900.31.tar.gz | tar xvz && \
     cd jasper* && \
     autoreconf -i && \
     ./configure --prefix /usr && \
     make install && \
     rm -rf /tmp/jasper*

WORKDIR /src

COPY entrypoint.sh /
ENTRYPOINT /entrypoint.sh
