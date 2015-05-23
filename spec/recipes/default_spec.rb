require_relative '../spec_helper'

# https://github.com/sethvargo/chefspec#readme
describe 'ownberry::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }
  it 'includes recipes' do
    expect(chef_run).to include_recipe('ownberry::_stuff')
    expect(chef_run).to include_recipe('ownberry::_packages')
    expect(chef_run).to include_recipe('ownberry::_nginx')
    expect(chef_run).to include_recipe('ownberry::_database')
  end
end
