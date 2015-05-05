FROM resin/rpi-raspbian:jessie

MAINTAINER jakobengdahl

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    usbutils \
    libflac-dev \
    libfaad2  \
    libmad0 \
    libasound2-dev \
    libasound2 \
    libasound2-data \
    wget

RUN wget http://squeezelite-downloads.googlecode.com/git/squeezelite-armv6hf

RUN chmod a+x squeezelite-armv6hf

CMD /squeezelite-armv6hf -o $SOUNDDEVICE -s $SERVER -n $CLIENTNAME -m $CLIENTMAC
