#
# Cookbook Name:: chef_pi
# Recipe:: default
#

# <> includes
include_recipe 'chef_pi::_stuff'
include_recipe 'chef_pi::_packages'
include_recipe 'chef_pi::_nginx'
include_recipe 'chef_pi::_database'

# <> download owncloud
remote_file "#{Chef::Config[:file_cache_path]}/#{node['chef_pi']['oc']['filename']}" do
  source "#{node['chef_pi']['oc']['url']}/#{node['chef_pi']['oc']['filename']}"
  not_if { ::File.exist?("#{Chef::Config[:file_cache_path]}/node['chef_pi']['oc']['filename']") }
  notifies :run, 'bash[unpack owncloud]', :immediately
end

bash 'unpack owncloud' do
  code <<-EOH
    mkdir -p #{node['chef_pi']['nginx']['root']}
    tar xjf #{Chef::Config[:file_cache_path]}/#{node['chef_pi']['oc']['filename']} -C #{node['chef_pi']['nginx']['root']}
    chown -R #{node['chef_pi']['nginx']['user']}:#{node['chef_pi']['nginx']['group']} #{node['chef_pi']['nginx']['oc-root']}
  EOH
  not_if { ::File.exist?(node['chef_pi']['nginx']['oc-root']) }
end

# <> configure owncloud
template "#{node['chef_pi']['nginx']['oc-root']}/config/config.php" do
  source 'config.php.erb'
  owner node['chef_pi']['nginx']['user']
  group node['chef_pi']['nginx']['group']
  mode '0644'
  not_if { ::File.exist?("#{node['chef_pi']['nginx']['oc-root']}/config/config.php") }
end

directory '/var/www/owncloud/data' do
  owner node['chef_pi']['nginx']['user']
  group node['chef_pi']['nginx']['group']
  mode '0755'
  action :create
end
