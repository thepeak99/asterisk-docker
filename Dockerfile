FROM ubuntu:16.04

RUN apt-get update \
 && apt-get install -y build-essential wget ncurses-dev uuid-dev libjansson-dev libxml2-dev libsqlite3-dev libssl-dev \
 && wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-14-current.tar.gz -P /tmp \
 && mkdir /tmp/asterisk \
 && tar xf /tmp/asterisk-14-current.tar.gz -C /tmp/asterisk --strip-components 1 \
 && cd /tmp/asterisk \
 && ./configure \
 && make; make install \
 && rm -rf /tmp/asterisk*

CMD ["asterisk", "-f"]
