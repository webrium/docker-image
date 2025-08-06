FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
RUN add-apt-repository ppa:ondrej/php

RUN apt-get install -y curl zip unzip php8.4-fpm php8.4-cli php8.4-mysql php8.4-gd php8.4-curl php8.4-soap php8.4-mbstring php8.4-xml nginx
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:$PATH"

RUN apt-get update -y
RUN apt-get install -y git

#COPY ./config/nginx.conf /etc/nginx/
#COPY ./config/default.conf /etc/nginx/conf.d/
#COPY ./config/php/php.ini /etc/php/8.2/fpm/
#COPY ./config/php/www.conf /etc/php/8.2/fpm/pool.d/

#RUN mkdir /run/php/

#COPY ./src/ /var/www/html/
WORKDIR /var/www/html/

RUN chown -R www-data:www-data /var/www/html

CMD php-fpm8.2 && nginx -g "daemon off;"
