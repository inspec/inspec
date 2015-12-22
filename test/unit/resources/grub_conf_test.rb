# encoding: utf-8
# author: Thomas Cate

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::GrubConfig' do

  let(:resource) { load_resource('grub_conf') }

  it 'verify kernel include' do
    _(resource.send('kernel')).must_be_kind_of Array
  end

  it 'verify initrd include' do
    _(resource.send('kernel')).must_be_kind_of Array
  end

  it 'verify default' do
    _(resource.send('kernel')).must_equal '1'
  end

  it 'verify default' do
    _(resource.send('timeout')).must_equal '5'
  end

end
