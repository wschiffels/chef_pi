#
# Cookbook Name:: ownberry
# Recipe:: _packages
#

# <
# install additional things
# >

# <> clean apt-cache before installing additional stuff
execute 'update cache' do
  command 'apt-get clean && apt-get update'
  ignore_failure true
  not_if { ::File.exist?('/var/lib/apt/periodic/update-success-stamp') }
end

node['ownberry']['additional_packages'].each do |p|
  package p do
    action :install
  end
end
