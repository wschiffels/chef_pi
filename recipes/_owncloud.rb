#
# Cookbook Name:: ownberry
# Recipe:: _owncloud
#

#<> download owncloud and unpack to node['ownberry']['nginx']['root']
archive 'owncloud' do
  url "#{node['ownberry']['oc']['url']}/#{node['ownberry']['oc']['filename']}"
  owner node['ownberry']['nginx']['user']
  group node['ownberry']['nginx']['group']
  prefix node['ownberry']['nginx']['root']
  version node['ownberry']['oc']['version']
  extract_action 'unzip_and_strip_dir'
end

#<> create oc data directory
directory "#{node['ownberry']['nginx']['oc-root']}/data" do
  owner node['ownberry']['nginx']['user']
  group node['ownberry']['nginx']['group']
  mode '0755'
  action :create
end
