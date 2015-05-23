require_relative '../spec_helper'

# https://github.com/sethvargo/chefspec#readme
describe 'ownberry::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  before do
    stub_command("which nginx").and_return('/usr/sbin/nginx')
    stub_command("test -d /etc/php-fpm.d || mkdir -p /etc/php-fpm.d").and_return(0)
  end

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

  it 'installes php5-common' do
    expect(chef_run).to install_package('php5-common')
  end

  it 'installes php5-cli' do
    expect(chef_run).to install_package('php5-cli')
  end

  it 'installes php5-curl' do
    expect(chef_run).to install_package('php5-curl')
  end

  it 'installes php5-fpm' do
    expect(chef_run).to install_package('php5-fpm')
  end
end
