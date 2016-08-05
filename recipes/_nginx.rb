#
# Cookbook Name:: ownberry
# Recipe:: _nginx
#

include_recipe 'nginx'
include_recipe 'openssl'
include_recipe 'php-fpm'

#<> create self signed SSL certificate
openssl_x509 "/etc/ssl/#{node['ownberry']['nginx']['ssl-cert']}" do
  common_name node['ownberry']['nginx']['server-name']
  org node['ownberry']['nginx']['certificate']['org']
  org_unit node['ownberry']['nginx']['certificate']['unit']
  country node['ownberry']['nginx']['certificate']['country']
  not_if { ::File.exist?("/etc/ssl/#{node['ownberry']['nginx']['ssl-cert']}") }
end

#<> and for ssl_dhparam
execute 'create dhparams.pem' do
  command "openssl dhparam -out #{node['ownberry']['nginx']['dhparam']['path']} #{node['ownberry']['nginx']['dhparam']['bits']}"
  creates node['ownberry']['nginx']['dhparam']['path']
  action :run
end

#<> delete default vhost
file '/etc/nginx/conf.d/default' do
  action :delete
end

#<> create nginx vhost
template '/etc/nginx/sites-available/owncloud' do
  source 'nginx_oc.erb'
  owner 'root'
  group 'root'
  mode '0644'
  not_if { ::File.exist?('/etc/nginx/sites-available/owncloud') }
end

#<> activate vhost
nginx_site 'owncloud' do
  enable true
  not_if { ::File.exist?('/etc/nginx/sites-enabled/owncloud') }
  notifies :reload, 'service[nginx]', :immediately
end

#<> create fpm pool
php_fpm_pool 'www' do
  process_manager 'dynamic'
  php_options 'php_admin_flag[log_errors]' => 'Off', 'php_admin_value[default_charset]' => 'UTF-8'
end
