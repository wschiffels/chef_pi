#
# Cookbook Name:: ownberry
# Recipe:: default
#
#<> include common things
include_recipe 'ownberry::_stuff'
#<> include additional packages
include_recipe 'ownberry::_packages'
#<> include install nginx
include_recipe 'ownberry::_nginx'
#<> include setup mysql
include_recipe 'ownberry::_database'
#<> download/install/configure owncloud
include_recipe 'ownberry::_owncloud'
