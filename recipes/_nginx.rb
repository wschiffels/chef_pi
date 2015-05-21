#
# Cookbook Name:: chef_pi
# Recipe:: _nginx
#

include_recipe 'nginx'
include_recipe 'openssl'
include_recipe 'php-fpm'

# <> create self signed SSL certificate
openssl_x509 "/etc/ssl/#{node['chef_pi']['nginx']['ssl-cert']}" do
  common_name node['chef_pi']['nginx']['server-name']
  org node['chef_pi']['nginx']['certificate']['org']
  org_unit node['chef_pi']['nginx']['certificate']['unit']
  country node['chef_pi']['nginx']['certificate']['country']
  not_if { ::File.exist?("/etc/ssl/#{node['chef_pi']['nginx']['ssl-cert']}") }
end

#<> and for ssl_dhparam
execute 'create dhparams.pem' do
  command 'openssl dhparam -out /etc/ssl/private/dhparams.pem 2048'
  creates '/etc/ssl/private/dhparams.pem'
  action :run
end

# <> create nginx vhost
template '/etc/nginx/sites-available/owncloud' do
  source 'nginx_oc.erb'
  owner 'root'
  group 'root'
  mode '0644'
  not_if { ::File.exist?('/etc/nginx/sites-available/owncloud') }
end

# <> activate vhost
link '/etc/nginx/sites-enabled/owncloud' do
  to '/etc/nginx/sites-available/owncloud'
  not_if { ::File.exist?('/etc/nginx/sites-enabled/owncloud') }
  notifies :reload, 'service[nginx]', :immediately
end
