# Webrium docker image

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

  ``nitrocc/webrium:php8.2``  (is the default) <br>
  ``nitrocc/webrium:php8.1``<br>
  ``nitrocc/webrium:php7.4``
  
  
 ### Default ports:
  - http://localhost:8080 => Access to the site page
  - http://localhost:8081 => Access to the phpMyAdmin

