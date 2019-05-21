
require 'helper'

describe 'Inspec::Resources::OneGet' do

  it 'verify oneget package detail parsing' do
    resource = MockLoader.new(:windows).load_resource('oneget', 'Mozilla Firefox')
    pkg = {
      name: 'Mozilla Firefox 40.0.3 (x86 en-US)',
      version: '40.0.3',
      type: 'oneget',
      installed: true,
    }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '40.0.3'
    _(resource.info).must_equal pkg
  end

  # catch cases where we recieve multiple return values
  # eg. happens if you do 'choco install ruby'
  it 'filter dups of Get-Package' do
    resource = MockLoader.new(:windows).load_resource('oneget', 'Ruby 2.1.6-p336-x64')
    pkg = {
      name: 'Ruby 2.1.6-p336-x64',
      version: '2.1.6-p336',
      type: 'oneget',
      installed: true,
    }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '2.1.6-p336'
    _(resource.info).must_equal pkg
  end

  it 'should skip on linux' do
    resource = MockLoader.new(:centos7).load_resource('oneget', 'Not available')
    pkg = { type: 'oneget', installed: false }
    _(resource.installed?).must_equal false
    _(resource.version).must_be_nil
    _(resource.info).must_equal pkg
  end
end
