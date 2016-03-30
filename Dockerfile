FROM alpine
MAINTAINER Lyndon li <snakeliwei@gmail.com>
RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && apk add --update py-pip py-m2crypto git && rm -rf /var/cache/apk/*
    && pip install cymysql
    && mkdir -p /sserver
    && git clone -b manyuser https://github.com/mengskysama/shadowsocks.git /sserver
WORKDIR /sserver
# Configure container to run as an executable
ENTRYPOINT ["python /sserver/shadowsocks/server.py"]
