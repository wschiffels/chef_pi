#
# Cookbook Name:: ownberry
# Attributes:: default
#

# <> additional  to install
default['ownberry']['additional_packages'] = [
  'vim',
  'vim-common',
  'postfix',
  'php5-common',
  'php5-fpm',
  'php5-gd',
  'php5-intl',
  'php5-mysql',
  'php5-curl',
  'php5-cli',
  'redis-server',
  'php5-redis'
]

# <> nginx upstream things
default['nginx']['version'] = '1.8.0'
default['nginx']['default_site_enabled'] = false
default['nginx']['gzip'] = 'on'

# <> php socket
default['ownberry']['php']['fastcgi_pass'] = 'unix:/var/run/php-fpm-www.sock'

# <> SSL related attributes
default['ownberry']['nginx']['server-name'] = '_'
default['ownberry']['nginx']['cert-path'] = '/etc/ssl/certs'
default['ownberry']['nginx']['ssl-cert'] = 'server.crt'
default['ownberry']['nginx']['ssl-key'] = 'server.key'
default['ownberry']['nginx']['certificate']['org'] = 'ACME'
default['ownberry']['nginx']['certificate']['unit'] = 'unit 1'
default['ownberry']['nginx']['certificate']['country'] = 'DE'
# <> nginx attributes
default['ownberry']['nginx']['root'] = '/var/www'
default['ownberry']['nginx']['oc-root'] = '/var/www/owncloud/versions/current'
default['ownberry']['nginx']['user'] = 'www-data'
default['ownberry']['nginx']['group'] = 'www-data'
default['ownberry']['nginx']['dhparam']['path'] = '/etc/ssl/certs/dhparams.pem'
default['ownberry']['nginx']['dhparam']['bits'] = '1024'

# <> owncloud things
default['ownberry']['oc']['url'] = 'https://download.owncloud.org/community/'
default['ownberry']['oc']['version'] = '9.0.2'
default['ownberry']['oc']['filename'] = "owncloud-#{node['ownberry']['oc']['version']}.zip"
