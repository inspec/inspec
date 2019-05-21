
require 'helper'

describe 'Inspec::Resources::GrubConfig' do

  # Grub2 with `GRUB_DEFAULT=0`
  it 'parses correctly with grub2 and `GRUB_DEfAULT=0`' do
    resource = MockLoader.new(:centos7).load_resource('grub_conf')

    resource.kernel.must_include '/vmlinuz-yup-kernel-works'
    resource.initrd.must_equal '/initramfs-yup-initrd-works'
  end

  # Grub2 with `GRUB_DEFAULT=saved`
  it 'parses correctly with grub2 and `saved` as the `GRUB_DEFAULT`' do
    resource = MockLoader.new(:centos7).load_resource('grub_conf')

    # Both Grub1 and Grub2 use `/etc/default/grub`.
    # This overrides the Grub1 default for testing.
    resource.instance_variable_set(
      :@defaults_path,
      '/etc/default/grub_with_saved'
    )

    resource.kernel.must_include '/vmlinuz-3.10.0-229.el7.x86_64'
    resource.initrd.must_equal '/initramfs-3.10.0-229.el7.x86_64.img'
  end

  it 'parses correctly with grub2 and an invalid grubenv entry' do
    resource = MockLoader.new(:centos7).load_resource('grub_conf')

    # Both Grub1 and Grub2 use `/etc/default/grub`.
    # This overrides the Grub1 default for testing.
    resource.instance_variable_set(
      :@defaults_path,
      '/etc/default/grub_with_saved'
    )

    resource.instance_variable_set(
      :@grubenv_path,
      '/boot/grub2/grubenv_invalid'
    )

    resource.kernel.must_include '/vmlinuz-yup-kernel-works'
    resource.initrd.must_equal '/initramfs-yup-initrd-works'
  end

  # Grub2 with a specified kernel
  it 'parses data correctly with grub2 and a specified kernel' do
    resource = MockLoader.new(:centos7).load_resource(
      'grub_conf',
      '/boot/grub2/grub.cfg',
      'CentOS Linux 7 (Core), with Linux 0-rescue'
    )

    resource.kernel.must_include '/vmlinuz-0-rescue'
    resource.initrd.must_equal '/initramfs-0-rescue.img'
  end

  # Legacy Grub
  it 'parses correctly with grub1 (aka legacy-grub)' do
    resource = MockLoader.new(:centos6).load_resource('grub_conf')

    resource.kernel.must_include '/vmlinuz-2.6.32-573.7.1.el6.x86_64'
    resource.initrd.must_equal '/initramfs-2.6.32-573.7.1.el6.x86_64.img'
    resource.default.must_equal '0'
    resource.timeout.must_equal '5'
  end

  # Legacy Grub with a specified kernel
  it 'parses data correctly with grub1 and a specified kernel' do
    resource = MockLoader.new(:centos6).load_resource(
      'grub_conf',
      '/etc/grub.conf',
      'CentOS 6 (2.6.32-573.el6.x86_64)'
    )

    resource.kernel.must_include '/vmlinuz-2.6.32-573.el6.x86_64'
    resource.initrd.must_equal '/initramfs-2.6.32-573.el6.x86_64.img'
    resource.default.must_equal '0'
    resource.timeout.must_equal '5'
  end
end
