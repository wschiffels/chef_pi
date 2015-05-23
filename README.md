# Description

this is for testing only, though it should basically work

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

* ownberry::default - play around with chef

# License and Maintainer

Maintainer:: wschiffels

Copyright:: 2015, wschiffels

License::
