# Description

unusable test thing

# Requirements

## Platform:

*No platforms defined*

## Cookbooks:

* mysqld
* nginx
* openssl

# Attributes

* `node['chef_pi']['additional_packages']` -  Defaults to `[ ... ]`.
* `node['nginx']['version']` - nginx things. Defaults to `1.8.0`.
* `node['chef_pi']['nginx']['server-name']` -  Defaults to `foo.example.com`.
* `node['chef_pi']['nginx']['cert-path']` -  Defaults to `/etc/ssl/certs`.
* `node['chef_pi']['nginx']['ssl-cert']` -  Defaults to `server.crt`.
* `node['chef_pi']['nginx']['ssl-key']` -  Defaults to `server.key`.
* `node['chef_pi']['nginx']['oc-root']` -  Defaults to `/var/www/owncloud`.

# Recipes

* [chef_pi::default](#chef_pidefault) - highly unusable test thing

## chef_pi::default

motd stuff

install additional things

clean apt-cache before installing additional stuff
include recipies
create certificate
nginx vhost

# License and Maintainer

Maintainer:: YOUR_NAME (YOUR_NAME)

Copyright:: YEAR, YOUR_NAME

License::
