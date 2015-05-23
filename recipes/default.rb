#
# Cookbook Name:: ownberry
# Recipe:: default
#

# <> common things
include_recipe 'ownberry::_stuff'
# <> additional packages
include_recipe 'ownberry::_packages'
# <> install nginx
include_recipe 'ownberry::_nginx'
# <> setup mysql
include_recipe 'ownberry::_database'
# <> download/install/configure owncloud
include_recipe 'ownberry::_owncloud'
