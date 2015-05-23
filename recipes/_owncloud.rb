#
# Cookbook Name:: chef_pi
# Recipe:: _owncloud
#

archive 'owncloud' do
  url "#{node['chef_pi']['oc']['url']}/#{node['chef_pi']['oc']['filename']}"
  owner node['chef_pi']['nginx']['user']
  group node['chef_pi']['nginx']['group']
  prefix node['chef_pi']['nginx']['root']
  version node['chef_pi']['oc']['version']
  extract_action 'unzip_and_strip_dir'
end

# <> configure owncloud
template "#{node['chef_pi']['nginx']['oc-root']}/config/config.php" do
  source 'config.php.erb'
  owner node['chef_pi']['nginx']['user']
  group node['chef_pi']['nginx']['group']
  mode '0644'
  not_if { ::File.exist?("#{node['chef_pi']['nginx']['oc-root']}/config/config.php") }
  notifies :run, 'execute[update-oc]', :immediately
end

directory "#{node['chef_pi']['nginx']['oc-root']}/data" do
  owner node['chef_pi']['nginx']['user']
  group node['chef_pi']['nginx']['group']
  mode '0755'
  action :create
end

execute 'update-oc' do
  command 'sudo -u www-data php /var/www/owncloud/versions/current/occ upgrade'
  action :run
  ignore_failure true
end
