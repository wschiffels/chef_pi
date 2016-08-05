# Description

installs nginx, php-fpm and owncloud. This is for testing only, though it should basically work

# Requirements

## Platform:

* debian (= 8.0)

## Cookbooks:

* mysqld
* nginx
* openssl
* php-fpm
* archive
* rsyslog

# Attributes

* `node['ownberry']['additional_packages']` - additional  to install. Defaults to `[ ... ]`.
* `node['nginx']['version']` - nginx upstream things. Defaults to `1.10.1`.
* `node['nginx']['default_site_enabled']` -  Defaults to `false`.
* `node['nginx']['gzip']` -  Defaults to `on`.
* `node['ownberry']['php']['fastcgi_pass']` - php socket. Defaults to `unix:/var/run/php-fpm-www.sock`.
* `node['ownberry']['nginx']['server-name']` - SSL related attributes. Defaults to `_`.
* `node['ownberry']['nginx']['cert-path']` -  Defaults to `/etc/ssl/certs`.
* `node['ownberry']['nginx']['ssl-cert']` -  Defaults to `server.crt`.
* `node['ownberry']['nginx']['ssl-key']` -  Defaults to `server.key`.
* `node['ownberry']['nginx']['certificate']['org']` -  Defaults to `ACME`.
* `node['ownberry']['nginx']['certificate']['unit']` -  Defaults to `unit 1`.
* `node['ownberry']['nginx']['certificate']['country']` -  Defaults to `DE`.
* `node['ownberry']['nginx']['root']` - nginx attributes. Defaults to `/var/www`.
* `node['ownberry']['nginx']['oc-root']` -  Defaults to `/var/www/owncloud/versions/current`.
* `node['ownberry']['nginx']['user']` -  Defaults to `www-data`.
* `node['ownberry']['nginx']['group']` -  Defaults to `www-data`.
* `node['ownberry']['nginx']['dhparam']['path']` -  Defaults to `/etc/ssl/certs/dhparams.pem`.
* `node['ownberry']['nginx']['dhparam']['bits']` -  Defaults to `1024`.
* `node['ownberry']['oc']['url']` - owncloud things. Defaults to `https://download.owncloud.org/community/`.
* `node['ownberry']['oc']['version']` -  Defaults to `9.1.0`.
* `node['ownberry']['oc']['filename']` -  Defaults to `owncloud-#{node['ownberry']['oc']['version']}.zip`.

# Recipes

* [ownberry::default](#ownberrydefault) - includes all recipes
* [ownberry::_database](#ownberry_database) - install mysql, setup oc database
* [ownberry::_nginx](#ownberry_nginx) - install nginx, configure ov vhost, create self-signed certificate
* [ownberry::_packages](#ownberry_packages) - install additional packages
* [ownberry::_stuff](#ownberry_stuff) - unrelated things

## ownberry::default

include common things
include additional packages
include install nginx
include setup mysql
download/install/configure owncloud

## ownberry::_database

include upstream recipies

## ownberry::_nginx

create self signed SSL certificate
and for ssl_dhparam
delete default vhost
create nginx vhost
activate vhost
create fpm pool

## ownberry::_packages

install additional things

clean apt-cache before installing additional stuff
install additional packages

## ownberry::_stuff

some unrelated stuff

edit motd
set aliases

# License and Maintainer

Maintainer:: YOUR_NAME (YOUR_NAME)

Copyright:: YEAR, YOUR_NAME

License::
