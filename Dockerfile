## Project Page: https://github.com/ety001/docker-zcc-cli
FROM ubuntu:16.04
MAINTAINER ety001 <ety001@domyself.me>
VOLUME /root/.zccoin
COPY sources.list /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y git build-essential libssl-dev \
    libqrencode-dev libboost-all-dev libdb++-dev libminiupnpc-dev \
    && git clone https://github.com/zccoin/zccoin.git /zccoin \
    && cd /zccoin/src \
    && make -f makefile.unix \
    && mv zccoind /usr/bin/ \
    && cd \
    && rm -rf /zccoin \
    && apt-get remove -y git build-essential libssl-dev \
    libqrencode-dev libboost-all-dev libdb++-dev libminiupnpc-dev \
    && apt-get clean && apt-get autoclean
ENTRYPOINT ["/usr/bin/zccoind"]
