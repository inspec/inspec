# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::YAML' do
  it 'verify yaml parsing' do
    resource = load_resource('yaml', 'kitchen.yml')
    _(resource.params).wont_be_nil
    _(resource.send('driver.name')).must_equal 'vagrant'
    _(resource.send('driver.customize.memory')).must_equal 1024
    _(resource.send('platforms.1.name')).must_equal 'centos-6.7'
    _(resource.send('platforms.name')).must_equal %w{centos-5.11 centos-6.7}
  end
end
