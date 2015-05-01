# Description

unusable test thing

# Requirements

## Platform:

*No platforms defined*

## Cookbooks:

* mysqld
* nginx
* openssl
* php-fpm

# Attributes

* `node['chef_pi']['additional_packages']` -  Defaults to `[ ... ]`.
* `node['nginx']['version']` -  Defaults to `1.8.0`.
* `node['chef_pi']['php']['fastcgi_pass']` -  Defaults to `unix:/var/run/php-fpm-www.sock`.
* `node['chef_pi']['nginx']['server-name']` -  Defaults to `foo.example.com`.
* `node['chef_pi']['nginx']['cert-path']` -  Defaults to `/etc/ssl/certs`.
* `node['chef_pi']['nginx']['ssl-cert']` -  Defaults to `server.crt`.
* `node['chef_pi']['nginx']['ssl-key']` -  Defaults to `server.key`.
* `node['chef_pi']['nginx']['certificate']['org']` -  Defaults to `ACME`.
* `node['chef_pi']['nginx']['certificate']['unit']` -  Defaults to `unit 1`.
* `node['chef_pi']['nginx']['certificate']['country']` -  Defaults to `DE`.
* `node['chef_pi']['nginx']['root']` -  Defaults to `/var/www`.
* `node['chef_pi']['nginx']['oc-root']` -  Defaults to `/var/www/owncloud`.
* `node['chef_pi']['nginx']['user']` -  Defaults to `www-data`.
* `node['chef_pi']['nginx']['group']` -  Defaults to `www-data`.
* `node['chef_pi']['oc']['url']` -  Defaults to `https://download.owncloud.org/community/`.
* `node['chef_pi']['oc']['filename']` -  Defaults to `owncloud-8.0.2.tar.bz2`.
* `node['chef_pi']['oc']['version']` -  Defaults to `8.0.2`.
* `node['chef_pi']['oc']['config']['dbhost']` -  Defaults to `127.0.0.1`.
* `node['chef_pi']['oc']['config']['dbpass']` -  Defaults to `admin`.
* `node['chef_pi']['oc']['config']['secret']` -  Defaults to `ifionlyhadagoodsecret`.

# Recipes

* chef_pi::default - highly unusable test thing

# License and Maintainer

Maintainer:: YOUR_NAME (YOUR_NAME)

Copyright:: YEAR, YOUR_NAME

License:: WTFPL
