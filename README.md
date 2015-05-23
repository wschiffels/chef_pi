# Description

installs nginx, php-fpm and owncloud. This is for testing only, though it should basically work

# Requirements

## Platform:

* Debian (= 7.8)

## Cookbooks:

* mysqld
* nginx
* openssl
* php-fpm
* archive

# Attributes

* `node['ownberry']['additional_packages']` -  Defaults to `[ ... ]`.
* `node['nginx']['version']` -  Defaults to `1.8.0`.
* `node['ownberry']['php']['fastcgi_pass']` -  Defaults to `unix:/var/run/php-fpm-www.sock`.
* `node['ownberry']['nginx']['server-name']` -  Defaults to `foo.example.com`.
* `node['ownberry']['nginx']['cert-path']` -  Defaults to `/etc/ssl/certs`.
* `node['ownberry']['nginx']['ssl-cert']` -  Defaults to `server.crt`.
* `node['ownberry']['nginx']['ssl-key']` -  Defaults to `server.key`.
* `node['ownberry']['nginx']['certificate']['org']` -  Defaults to `ACME`.
* `node['ownberry']['nginx']['certificate']['unit']` -  Defaults to `unit 1`.
* `node['ownberry']['nginx']['certificate']['country']` -  Defaults to `DE`.
* `node['ownberry']['nginx']['root']` -  Defaults to `/var/www`.
* `node['ownberry']['nginx']['oc-root']` -  Defaults to `/var/www/owncloud/versions/current`.
* `node['ownberry']['nginx']['user']` -  Defaults to `www-data`.
* `node['ownberry']['nginx']['group']` -  Defaults to `www-data`.
* `node['ownberry']['oc']['url']` -  Defaults to `https://download.owncloud.org/community/`.
* `node['ownberry']['oc']['filename']` -  Defaults to `owncloud-8.0.3.zip`.
* `node['ownberry']['oc']['version']` -  Defaults to `8.0.3`.
* `node['ownberry']['oc']['config']['dbhost']` -  Defaults to `127.0.0.1`.
* `node['ownberry']['oc']['config']['dbpass']` -  Defaults to `admin`.
* `node['ownberry']['oc']['config']['secret']` -  Defaults to `ifionlyhadagoodsecret`.

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
initial mysql grants and dump
create oc.dump from template
source oc.dump
grant privileges

## ownberry::_nginx

create self signed SSL certificate
and for ssl_dhparam
create nginx vhost
activate vhost

## ownberry::_packages

clean apt-cache before installing additional stuff
install additional packages

## ownberry::_stuff

edit motd
set aliases

# License and Maintainer

Maintainer:: YOUR_NAME (YOUR_NAME)

Copyright:: YEAR, YOUR_NAME

License::
