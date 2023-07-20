FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
RUN add-apt-repository ppa:ondrej/php

RUN apt-get install -y curl zip unzip php8.2-fpm php8.2-cli php8.2-mysql php8.2-gd php8.2-curl php8.2-soap php8.2-mbstring nginx
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash
RUN apt-get update -y
RUN apt-get install -y nodejs git

COPY ./config/nginx.conf /etc/nginx/
COPY ./config/default.conf /etc/nginx/conf.d/
COPY ./config/php/php.ini /etc/php/8.2/fpm/
COPY ./config/php/www.conf /etc/php/8.2/fpm/pool.d/

RUN mkdir /run/php/

COPY ./src/ /var/www/html/
WORKDIR /var/www/html/
RUN composer install

RUN chown -R www-data:www-data /var/www/html

CMD php-fpm8.2 && nginx -g "daemon off;"
