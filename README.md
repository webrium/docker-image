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
  - http://localhost:8080 => Access to the site
  - http://localhost:8081 => Access to the phpMyAdmin


## Suggested web server configuration

default.conf:
```NGINX

map $http_x_forwarded_proto $https_flag {
    default off;
    https on;
}

server{
        listen 80;
        root /var/www/html/public;
        index index.html index.php;
        server_name localhost;

        location ~ \.php$ {
                try_files $uri =404;
                fastcgi_split_path_info ^(.+\.php)(/.+)$;
                fastcgi_param HTTPS $https_flag;
                fastcgi_pass 127.0.0.1:9000;
                fastcgi_index index.php;
                include fastcgi_params;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                fastcgi_param PATH_INFO $fastcgi_path_info;
        }

        location / {
                try_files $uri $uri/ /index.php?$query_string;
                gzip_static on;
        }

        location ^~ /phpmyadmin/ {
                proxy_pass http://phpmyadmin/;
                absolute_redirect off;
        }
}

```

## Proxy server to docker container

```NGINX
server {
  listen 80;
  server_name your_domain.com;

   location / {
    proxy_pass http://localhost:8080;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }
}

```
