#
# Cookbook Name:: chef_pi
# Recipe:: default
#

# <
# unrelated stuff
# >

# <> motd
file '/var/run/motd' do
  action :delete
  only_if { File.exist?('/var/run/motd') }
end

link '/etc/motd' do
  action :delete
  only_if { ::File.symlink?('/etc/motd') }
end

template '/etc/motd' do
  source 'motd.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

# <> aliases
template '/etc/profile.d/aliases.sh' do
  source 'aliases.erb'
  owner 'root'
  group 'root'
  mode 0755
  not_if { ::File.exist?('/etc/profile.d/aliases.sh') }
end

# <
# install additional things
# >

# <> clean apt-cache before installing additional stuff
execute 'update cache' do
  command 'apt-get clean && apt-get update'
  ignore_failure true
  not_if { ::File.exist?('/var/lib/apt/periodic/update-success-stamp') }
end

node['chef_pi']['additional_packages'].each do |p|
  package p do
    action :install
  end
end

# <> include recipies
include_recipe 'mysqld'
include_recipe 'nginx'
include_recipe 'php-fpm'
include_recipe 'openssl'

# <> create certificate
openssl_x509 "/etc/ssl/#{node['chef_pi']['nginx']['ssl-cert']}" do
  common_name "#{node['chef_pi']['nginx']['server-name']}"
  org 'Foo Bar'
  org_unit 'Lab'
  country 'DE'
  not_if { ::File.exist?("/etc/ssl/#{node['chef_pi']['nginx']['ssl-cert']}") }
end

# <> nginx vhost
template '/etc/nginx/sites-available/default' do
  source 'nginx_oc.erb'
  owner 'root'
  group 'root'
  mode '0644'
end
