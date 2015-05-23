#
# Cookbook Name:: ownberry
# Recipe:: _owncloud
#

archive 'owncloud' do
  url "#{node['ownberry']['oc']['url']}/#{node['ownberry']['oc']['filename']}"
  owner node['ownberry']['nginx']['user']
  group node['ownberry']['nginx']['group']
  prefix node['ownberry']['nginx']['root']
  version node['ownberry']['oc']['version']
  extract_action 'unzip_and_strip_dir'
end

# <> configure owncloud
template "#{node['ownberry']['nginx']['oc-root']}/config/config.php" do
  source 'config.php.erb'
  owner node['ownberry']['nginx']['user']
  group node['ownberry']['nginx']['group']
  mode '0644'
  not_if { ::File.exist?("#{node['ownberry']['nginx']['oc-root']}/config/config.php") }
  notifies :run, 'execute[update-oc]', :immediately
end

directory "#{node['ownberry']['nginx']['oc-root']}/data" do
  owner node['ownberry']['nginx']['user']
  group node['ownberry']['nginx']['group']
  mode '0755'
  action :create
end

execute 'update-oc' do
  command 'sudo -u www-data php /var/www/owncloud/versions/current/occ upgrade'
  action :run
  ignore_failure true
end
