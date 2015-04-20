#
# Cookbook Name:: chef_pi
# Recipe:: default
#

#<
# motd stuff
#>

# delete if exists
file '/var/run/motd' do
  action :delete
  only_if { File.exist?('/var/run/motd') }
end

link '/etc/motd' do
  action :delete
  only_if { File.symlink?('/etc/motd')}
end

template '/etc/motd' do
  source 'motd.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

#<
# install additional packages
#>

node['chef_pi']['additional_packages'].each do |p|
  package p do
    action :upgrade
  end
end
