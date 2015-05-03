require_relative '../spec_helper'

# https://github.com/sethvargo/chefspec#readme
describe 'chef_pi::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }
  it 'includes recipes' do
    expect(chef_run).to include_recipe('chef_pi::_stuff')
    expect(chef_run).to include_recipe('chef_pi::_packages')
    expect(chef_run).to include_recipe('chef_pi::_nginx')
    expect(chef_run).to include_recipe('chef_pi::_database')
  end
end
