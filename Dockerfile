FROM alpine:3.7

RUN apk update \
 && apk add libxml2 sqlite-libs openssl libssl1.0 jansson util-linux \
 && apk add -t build bash build-base ncurses-dev util-linux-dev jansson-dev libxml2-dev sqlite-dev bsd-compat-headers openssl-dev \
 && wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-14-current.tar.gz -P /tmp \
 && mkdir /tmp/asterisk \
 && tar xf /tmp/asterisk-14-current.tar.gz -C /tmp/asterisk --strip-components 1 \
 && cd /tmp/asterisk \
 && ./configure \
 && make; make install \
 && rm -rf /tmp/asterisk* \
 && apk del build

CMD ["asterisk", "-f"]
