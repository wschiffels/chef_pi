#
# Cookbook Name:: chef_pi
# Recipe:: _database
#
# <> include upstream recipies
include_recipe 'mysqld'

# <> initial mysql grants and dump
template '/tmp/grants.sql' do
  source 'grants.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/tmp/oc.dump' do
  source 'oc.dump.erb'
  owner 'root'
  group 'root'
  mode '0644'
  not_if { ::File.exist?('/tmp/oc.dump') }
  notifies :run, 'bash[initialize oc database]', :immediately
end

bash 'initialize oc database' do
  code <<-EOH
    mysql < /tmp/oc.dump
  EOH
    notifies :run, 'bash[base grants]', :immediately
end

bash 'base grants' do
  code <<-EOH
    mysql < /tmp/grants.sql
  EOH
end

# <> this....
#require 'digest/sha1'
#
#def hash_mysql_password pass
#  "*" + Digest::SHA1.hexdigest(Digest::SHA1.digest(pass)).upcase
#end
#
#hash_mysql_password 'foo'