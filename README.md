# Webrium docker image

## About this image

This Docker image is based on the Ubuntu 22.04 distribution and features PHP version 8.2, Nginx web server, and Node.js installed within it. It is designed to serve as a comprehensive hosting platform for various PHP frameworks and websites. The primary focus of this image is to host websites and applications built on the Webrium framework. With its pre-installed components and dependencies, this Docker image streamlines the deployment process of PHP-based applications, enabling users to get started quickly and efficiently.

## Description

This image includes `nginx`, `php`, `mariadb` and `phpmyadmin`

You can easily set up and use your server without the need for configuration, but if needed, you can easily customize nginx and php configurations. The config files are located in the `config` directory

You can edit the `docker-compose.yml` file to change the default ports

## Install
```
git clone https://github.com/webrium/docker-image.git webrium
cd webrium
git clone https://github.com/webrium/webrium src
cp src/.env.example src/.env
```
Then:

```
docker compose up -d
```

### Available tags:

  ``nitrocc/webrium:php8.2`` 
  
  
 ### Default ports:
  - http://localhost:8080 => Access to the site page
  - http://localhost:8081 => Access to the phpMyAdmin

