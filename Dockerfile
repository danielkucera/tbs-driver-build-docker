FROM ubuntu
MAINTAINER Daniel Kucera

RUN mkdir /build
WORKDIR /build

RUN apt-get update
RUN apt-get -y install wget unzip bzip2 make gcc kmod perl-modules patch nano

ARG driver=tbs-linux-drivers_v170330.zip

RUN wget https://www.tbsiptv.com/download/common/$driver
RUN unzip $driver
RUN tar -xf linux-tbs-drivers.tar.bz2

ARG kernel=4.4.0-109-generic

RUN apt-get -y install linux-headers-$kernel

ENV VER=$kernel

WORKDIR /build/linux-tbs-drivers
#COPY kernel-4.13.patch .
#RUN patch -p0 < kernel-4.13.patch
RUN ./v4l/tbs-x86_64.sh
RUN make -j5
RUN make install
RUN tar -cf drivers.tar /lib/modules/$kernel/kernel/  

#CMD ["/usr/bin/mongod", "--config", "/etc/mongodb.conf"] 
