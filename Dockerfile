FROM ubuntu:24.04

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update && \
  apt-get -y upgrade

RUN \
  apt-get -y --no-install-recommends install git g++ wget curl zip vim pkg-config tar cmake unzip ca-certificates

RUN git clone https://github.com/microsoft/vcpkg
WORKDIR vcpkg
RUN ./bootstrap-vcpkg.sh

ENV PATH "/vcpkg:$PATH"
ENV VCPKG_ROOT "/vcpkg"

WORKDIR /project