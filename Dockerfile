FROM ubuntu AS builder

WORKDIR /build/
RUN apt-get update -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y git libboost-all-dev build-essential libpcap-dev libhyperscan-dev libhyperscan5 vim
RUN git clone https://github.com/seladb/PcapPlusPlus.git
WORKDIR /build/PcapPlusPlus/
RUN ./configure-linux.sh .
RUN make
RUN make install
WORKDIR /build/
