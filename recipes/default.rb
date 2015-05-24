#
# Cookbook Name:: ownberry
# Recipe:: default
#

=begin
to install chef on the raspberry run
# install chef
apt-get install rubygems bundler
gem install chef --version 11.18.12
```

or to install a more recent ruby/chef versions

```bash
apt-get install git
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install $recent_ruby
rbenv global $recent_ruby
gem install chef
```

bootstrap node from workstation

```bash
knife bootstrap -N $NODENAME -x $USER -P $PASSWD --sudo $IP
```
=end

#<> include common things
include_recipe 'ownberry::_stuff'
#<> include additional packages
include_recipe 'ownberry::_packages'
#<> include install nginx
include_recipe 'ownberry::_nginx'
#<> include setup mysql
include_recipe 'ownberry::_database'
#<> download/install/configure owncloud
include_recipe 'ownberry::_owncloud'
