require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Npm' do
  it 'verify npm package detail parsing' do
    resource = load_resource('npm', 'bower')
    pkg = {
      name: 'bower',
      version: '1.4.1',
      type: 'npm',
      installed: true,
    }
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
  end

  it 'verify npm package in local folder' do
    resource = load_resource('npm', 'bower', path: '/path/to/project')
    pkg = {
      name: 'bower',
      version: '1.4.2',
      type: 'npm',
      installed: true,
    }
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
  end
end
