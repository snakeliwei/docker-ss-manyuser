FROM alpine
MAINTAINER Lyndon li <snakeliwei@gmail.com>
RUN apk add --update py-pip py-m2crypto git && rm -rf /var/cache/apk/*
RUN pip install cymysql
RUN mkdir -p /sserver
RUN git clone -b manyuser https://github.com/mengskysama/shadowsocks.git /sserver
WORKDIR /sserver
# Configure container to run as an executable
ENTRYPOINT ["python /sserver/shadowsocks/server.py"]
