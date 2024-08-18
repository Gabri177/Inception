FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/yugao.crt \
    -keyout /etc/nginx/ssl/yugao.key \
    -subj "/C=ES/ST=Madrid/L=Madrid/O=42 Madrid/CN=yugao.com"

COPY ./conf/default /etc/nginx/conf.d/default.conf

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

