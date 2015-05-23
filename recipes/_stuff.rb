#
# Cookbook Name:: ownberry
# Recipe:: _stuff
#

# <
# some unrelated stuff
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
