#
# Cookbook Name:: chef_pi
# Recipe:: default
#

# <> common things
include_recipe 'chef_pi::_stuff'
# <> additional packages
include_recipe 'chef_pi::_packages'
# <> install nginx
include_recipe 'chef_pi::_nginx'
# <> setup mysql
include_recipe 'chef_pi::_database'
# <> download/install/configure owncloud
include_recipe 'chef_pi::_owncloud'
