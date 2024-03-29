#!/bin/bash
apk update && apk upgrade
apk add apache2 && apk add apache2-proxy php8-fpm
rc-service php-fpm8 start
rc-update add php-fpm8
rc-service apache2 start
rc-update add apache2

apk add vim samba
mv vimrc ../.vimrc
echo "[code-share]
  wide links = yes
  browsable = yes
  writable = yes
  path = /var/www/localhost/htdocs" >> /etc/samba/smb.conf
smbpasswd -a apache
rc-update add samba
rc-service samba start
