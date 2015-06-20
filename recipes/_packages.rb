#
# Cookbook Name:: ownberry
# Recipe:: _packages
#

# <
# install additional things
# >

# ohai "platform_family": "debian",
#<> clean apt-cache before installing additional stuff

case node["platform_family"]
  when "debian"
    execute 'update cache' do
      command 'apt-get clean && apt-get update'
      action :run
      not_if { ::File.exist?('/var/lib/apt/periodic/update-success-stamp') }
    end
  when "redhat"
    execute 'update cache' do
      command 'yum clean metadata'
      action :run
    end
end

#<> install additional packages
node['ownberry']['additional_packages'].each do |p|
  package p do
    action :install
  end
end
