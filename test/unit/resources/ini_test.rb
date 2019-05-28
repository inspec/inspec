require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Ini' do

  it 'check ini parsing on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('ini', 'rootwrap.conf')
    result = {"DEFAULT"=>{"filters_path"=>"/etc/cinder/rootwrap.d,/usr/share/cinder/rootwrap", "exec_dirs"=>"/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin"}}
    _(resource.params).must_equal result
    _(resource.value(['DEFAULT','exec_dirs'])).must_equal '/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin'
  end
end
