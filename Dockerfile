FROM ubuntu:18.04

WORKDIR /build/
RUN apt-get update -y
RUN apt-get install -y apt-utils && apt-get clean cache
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y libre2-dev git libboost-all-dev build-essential libpcap-dev vim libhyperscan-dev libhyperscan4 protobuf-compiler libprotobuf-dev && apt-get clean cache
RUN git clone https://github.com/seladb/PcapPlusPlus.git
WORKDIR /build/PcapPlusPlus/
RUN ./configure-linux.sh .
RUN make && make install && rm /build/PcapPlusPlus/ -Rf
WORKDIR /build/
