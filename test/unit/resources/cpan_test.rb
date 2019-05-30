
require 'helper'
require 'inspec/resource'
require 'inspec/resources/cpan'

describe 'Inspec::Resources::Cpan' do
  it 'verify cpan package detail parsing' do
    resource = load_resource('cpan', 'DBD::Pg')
    pkg = {type: 'cpan', name: 'DBD::Pg', version: '3.7.0', installed: true}
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
  end
  it 'verify info for non-installed packages' do
    resource = load_resource('cpan', 'DOES::Not::Exist')
    pkg = {type: 'cpan', name: 'DOES::Not::Exist', installed: false}
    _(resource.installed?).must_equal false
    _(resource.version).must_be_nil
    _(resource.info[:name]).must_equal 'DOES::Not::Exist'
    _(resource.info[:type]).must_equal 'cpan'
    _(resource.info).must_equal pkg
  end
end
