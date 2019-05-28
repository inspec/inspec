require 'helper'
require 'inspec/resource'

describe Inspec::Resources::FileResource do
  let(:root_resource) { load_resource('mount', '/') }

  it 'parses the mount data properly' do
    root_resource.send(:device).must_equal('/dev/xvda1')
    root_resource.send(:type).must_equal('ext4')
    root_resource.send(:options).must_equal(['rw','discard'])
    root_resource.send(:count).must_equal(1)
  end

  let(:iso_resource) { load_resource('mount', '/mnt/iso-disk') }

  it 'parses the mount data properly' do
    iso_resource.send(:device).must_equal('/root/alpine-3.3.0-x86_64_2.iso')
    iso_resource.send(:type).must_equal('iso9660')
    iso_resource.send(:options).must_equal(['ro'])
    iso_resource.send(:count).must_equal(2)
  end

  let(:ws_resource) { load_resource('mount', '/mnt/Research & Development') }

  it 'parses the mount data properly even if whitespaces are included' do
    ws_resource.send(:device).must_equal('//fileserver.corp.internal/Research & Development')
    ws_resource.send(:type).must_equal('cifs')
    ws_resource.send(:options).must_equal(['rw','vers=1.0'])
    ws_resource.send(:count).must_equal(1)
  end
end
