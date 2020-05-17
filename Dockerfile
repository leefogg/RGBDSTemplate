FROM ubuntu
ARG defs=DEBUG
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y make gcc pkg-config flex bison libpng-dev git
RUN git clone -b v0.4.0 --depth=1 https://github.com/rednex/rgbds
RUN make -C rgbds CGLAGS=-O2 install

COPY src src
COPY makefile .
RUN make defs=${defs}
