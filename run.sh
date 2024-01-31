#!/bin/bash
apk update && apk upgrade -y
apk add apache2 && # apk add apache2-proxy php8-fpm
rc-service php-fpm8 start
rc-update add php-fpm8
rc-service apache2 start
rc-update add apache2
