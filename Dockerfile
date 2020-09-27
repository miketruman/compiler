FROM ubuntu:18.04

WORKDIR /build/
RUN apt-get update -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y git libboost-all-dev build-essential libpcap-dev vim
RUN apt-get install -y protobuf-compiler libprotobuf-dev
RUN git clone https://github.com/seladb/PcapPlusPlus.git
WORKDIR /build/PcapPlusPlus/
RUN ./configure-linux.sh .
RUN make
RUN make install
WORKDIR /build/
