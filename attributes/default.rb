#
# Cookbook Name:: chef_pi
# Attributes:: default
#

# <> additional  to install
default['chef_pi']['additional_packages'] = [
  'vim',
  'vim-common',
  'postfix',
  'php5-common',
  'php5-fpm',
  'php5-gd',
  'php5-intl',
  'php5-mysql'
]

# <> nginx upstream things
default['nginx']['version'] = '1.8.0'
# <> php socket
default['chef_pi']['php']['fastcgi_pass'] = 'unix:/var/run/php-fpm-www.sock'

# <> SSL related attributes
default['chef_pi']['nginx']['server-name'] = 'foo.example.com'
default['chef_pi']['nginx']['cert-path'] = '/etc/ssl/certs'
default['chef_pi']['nginx']['ssl-cert'] = 'server.crt'
default['chef_pi']['nginx']['ssl-key'] = 'server.key'
default['chef_pi']['nginx']['certificate']['org'] = 'ACME'
default['chef_pi']['nginx']['certificate']['unit'] = 'unit 1'
default['chef_pi']['nginx']['certificate']['country'] = 'DE'
# <> nginx attributes
default['chef_pi']['nginx']['root'] = '/var/www'
default['chef_pi']['nginx']['oc-root'] = '/var/www/owncloud'
default['chef_pi']['nginx']['user'] = 'www-data'
default['chef_pi']['nginx']['group'] = 'www-data'

# <> owncloud things
default['chef_pi']['oc']['url'] = 'https://download.owncloud.org/community/'
default['chef_pi']['oc']['filename'] = 'owncloud-8.0.2.tar.bz2'
default['chef_pi']['oc']['version'] = '8.0.2'
default['chef_pi']['oc']['config']['dbhost'] = '127.0.0.1'
# <> defaults to admin/admin
default['chef_pi']['oc']['config']['dbpass'] = 'admin'
default['chef_pi']['oc']['config']['secret'] = 'ifionlyhadagoodsecret'
