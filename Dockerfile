ARG DISTRO_IMAGE=ubuntu
ARG DISTRO_IMAGE_VERSION=20.04
FROM $DISTRO_IMAGE:$DISTRO_IMAGE_VERSION

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
# comment libnetcdff-dev to build in 14.04 only available in newer releases \
    libnetcdff-dev \
    libjpeg-dev \
    libjpeg-turbo8-dev \
    libbz2-dev \
    libgrib2c-dev \
    && apt-get clean

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
