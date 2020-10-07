FROM ubuntu:18.04

WORKDIR /build/
RUN apt-get update -y
RUN apt-get install -y apt-utils && apt-get clean cache
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y wget libre2-dev git build-essential libpcap-dev vim protobuf-compiler libprotobuf-dev && apt-get clean cache
WORKDIR /build/
RUN wget https://dl.bintray.com/boostorg/release/1.74.0/source/boost_1_74_0.tar.gz
RUN tar -zxvf boost_1_74_0.tar.gz
WORKDIR /build/boost_1_74_0/
RUN ./bootstrap.sh
RUN ./b2 install; exit 0
WORKDIR /build/
RUN git clone https://github.com/seladb/PcapPlusPlus.git
WORKDIR /build/PcapPlusPlus/
RUN ./configure-linux.sh .
RUN make && make install && rm /build/PcapPlusPlus/ -Rf
WORKDIR /build/
