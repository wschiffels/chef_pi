#
# Cookbook Name:: chef_pi
# Attributes:: default
#

# <> additional packages
default['chef_pi']['additional_packages'] = [
  'vim',
  'vim-common'
]

# <> nginx things
default['nginx']['version'] = '1.8.0'

# <> Owncloud attributes
default['chef_pi']['nginx']['server-name'] = 'foo.example.com'
default['chef_pi']['nginx']['cert-path'] = '/etc/ssl/certs'
default['chef_pi']['nginx']['ssl-cert'] = 'server.crt'
default['chef_pi']['nginx']['ssl-key'] = 'server.key'
default['chef_pi']['nginx']['oc-root'] = '/var/www/owncloud'
