# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::KernelModule' do

  #kernel version
  it 'Verify kernel_module version' do
    resource = load_resource('kernel_module', 'dhcp')
    _(resource.version).must_equal '3.2.2'
  end

  # loaded
  it 'Verify kernel_module parsing `loaded` - true' do
    resource = load_resource('kernel_module', 'bridge')
    _(resource.loaded?).must_equal true
  end

  it 'Verify kernel_module parsing `loaded` - false' do
    resource = load_resource('kernel_module', 'bridges')
    _(resource.loaded?).must_equal false
  end

  #disabled
  it 'Verify kernel_module parsing `disabled` - true ' do
    resource = load_resource('kernel_module', 'nvidiafb')
    _(resource.disabled?).must_equal true
  end

  it 'Verify kernel_module parsing `disabled` - false' do
    resource = load_resource('kernel_module', 'bridge')
    _(resource.disabled?).must_equal false
  end

  #/bin/true
  it 'Verify a kernel_module is disabled via /bin/true - true' do
    resource = load_resource('kernel_module', 'nvidiafb')
    _(resource.disabled_via_bin_true?).must_equal true
  end

  it 'Verify a kernel_module is not disabled via /bin/true - false' do
    resource = load_resource('kernel_module', 'ssftb')
    _(resource.disabled_via_bin_true?).must_equal false
  end

  #/bin/false
  it 'Verify a kernel_module is disabled via /bin/false - true' do
    resource = load_resource('kernel_module', 'sstfb')
    _(resource.disabled_via_bin_false?).must_equal true
  end

  it 'Verify a kernel_module is not disabled via /bin/false - true ' do
    resource = load_resource('kernel_module', 'nvidiafb')
    _(resource.disabled_via_bin_false?).must_equal false
  end

  # unlisted bin/true,/bin/false
  it 'Verify an unlisted kernel_module is not disabled via /bin/true - false' do
    resource = load_resource('kernel_module', 'floppy')
    _(resource.disabled_via_bin_false?).must_equal false
  end

  it 'Verify an unlisted kernel_module is not disabled via /bin/false - false' do
    resource = load_resource('kernel_module', 'floppy')
    _(resource.disabled_via_bin_false?).must_equal false
  end

  #blacklisting
  it 'Verify a kernel_module is blacklisted - true' do
    resource = load_resource('kernel_module', 'floppy')
    _(resource.blacklisted?).must_equal true
  end

  it 'Verify a kernel_module is not blacklisted - false' do
    resource = load_resource('kernel_module', 'ssftb')
    _(resource.blacklisted?).must_equal false
  end

  #unlisted moduled
  it 'Verify an unlisted kernel_module is not `loaded` - false' do
    resource = load_resource('kernel_module', 'not_a_module')
    _(resource.loaded?).must_equal false
  end

  it 'Verify an unlisted kernel_module is not `disabled` - false' do
    resource = load_resource('kernel_module', 'not_a_module')
    _(resource.disabled?).must_equal false
  end

  it 'Verify an unlisted kernel_module is not blacklisted - false' do
    resource = load_resource('kernel_module', 'not_a_module')
    _(resource.blacklisted?).must_equal false
  end

  it 'Verify an unlisted kernel_module is not disabled_via_bin_true - false' do
    resource = load_resource('kernel_module', 'not_a_module')
    _(resource.disabled_via_bin_true?).must_equal false
  end

  it 'Verify an unlisted kernel_module is not disabled_via_bin_false - false' do
    resource = load_resource('kernel_module', 'not_a_module')
    _(resource.disabled_via_bin_false?).must_equal false
  end
end
