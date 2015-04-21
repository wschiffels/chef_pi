#
# Cookbook Name:: chef_pi
# Attributes:: default
#

# <> additional packages
default['chef_pi']['additional_packages'] = [
  'nginx-full',
  'php5-common',
  'nginx-common',
  'php5-fpm',
  'php5-mysql',
  'mysql-server'
]

# <> Owncloud attributes
default['chef_pi']['nginx']['server-name'] = 'example.com'
default['chef_pi']['nginx']['ssl-cert'] = 'server.crt'
default['chef_pi']['nginx']['ssl-key'] = 'server.key'
default['chef_pi']['nginx']['oc-root'] = '/var/www/owncloud'
