require_relative '../spec_helper'

# https://github.com/sethvargo/chefspec#readme
describe 'ownberry::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'includes _stuff recipe' do
    expect(chef_run).to include_recipe('ownberry::_stuff')
  end

  it 'includes _packages recipe' do
    expect(chef_run).to include_recipe('ownberry::_packages')
  end

  it 'includes _nginx recipe' do
    expect(chef_run).to include_recipe('ownberry::_nginx')
  end

  it 'includes _database recipe' do
    expect(chef_run).to include_recipe('ownberry::_database')
  end

  it 'includes _owncloud recipe' do
    expect(chef_run).to include_recipe('ownberry::_owncloud')
  end

  it 'installes vim' do
    expect(chef_run).to install_package('vim')
  end

  it 'creates /etc/motd from template' do
    expect(chef_run).to create_template('/etc/motd')
  end

  it 'runs a execute to update deb cache' do
    expect(chef_run).to run_execute('update cache')
  end

  it 'installs php' do
    expect(chef_run).to install_package('php5-common')
    expect(chef_run).to install_package('php5-cli')
    expect(chef_run).to install_package('php5-curl')
    expect(chef_run).to install_package('php5-fpm')
    expect(chef_run).to install_package('php5-gd')
    expect(chef_run).to install_package('php5-intl')
    expect(chef_run).to install_package('php5-mysql')
    expect(chef_run).to install_package('php5-redis')
  end

  it 'installs redis-server' do
    expect(chef_run).to install_package('redis-server')
  end

  it 'installs postfix' do
    expect(chef_run).to install_package('postfix')
  end

  it 'installs vim-common' do
    expect(chef_run).to install_package('vim-common')
  end

  it 'deletes /var/run/motd' do
    allow(File).to receive(:exist?)
      .and_call_original
    allow(File).to receive(:exist?)
      .with('/var/run/motd')
      .and_return(true)
    expect(chef_run).to delete_file('/var/run/motd')
  end
  it 'deletes /etc/motd symlink' do
    allow(File).to receive(:symlink?)
      .and_call_original
    allow(File).to receive(:symlink?)
      .and_return(true)
    expect(chef_run).to delete_link('/etc/motd')
  end

  it 'creates /etc&profile.d/aliases.sh' do
    expect(chef_run).to create_template('/etc/profile.d/aliases.sh').with(
      user:   'root',
      group:  'root'
    )
  end
end
