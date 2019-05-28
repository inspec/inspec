require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Fstab' do
  let(:resource) { load_resource('etc_fstab') }
  it 'Verify etc_hosts filtering by `device_name`'  do
    entries = resource.where { device_name == '/dev/mapper/vg1-lv_root' }
    _(entries.mount_point).must_equal ['/']
    _(entries.file_system_type).must_equal ['xfs']
    _(entries.mount_options).must_equal [['defaults', 'x-systemd.device-timeout=0']]
    _(entries.dump_options).must_equal [0]
    _(entries.file_system_options).must_equal [0]
  end

  it 'Verify etc_hosts filtering by `mount_point`'  do
    entries = resource.where { mount_point == '/' }
    _(entries.device_name).must_equal ['/dev/mapper/vg1-lv_root']
    _(entries.file_system_type).must_equal ['xfs']
    _(entries.mount_options).must_equal [['defaults', 'x-systemd.device-timeout=0']]
    _(entries.dump_options).must_equal [0]
    _(entries.file_system_options).must_equal [0]
  end

  it 'Verify parsing an entry where mount_options is a single item' do
    resourceOneMount = load_resource('etc_fstab', 'fstab_one_mount')
    entries = resourceOneMount.where { file_system_options == 0 }
    _(entries.mount_options).must_equal [['defaults', 'x-systemd.device-timeout=0']]
  end

  it 'Verify parsing an entry where mount_options is multiple items' do
    entries = resource.where { file_system_options == 0 }
    _(entries.mount_options).must_equal [['defaults', 'x-systemd.device-timeout=0'] , ['defaults', 'nodev', 'nosuid'], ['defaults', 'x-systemd.device-timeout=0', 'nodev', 'nosuid'], ['defaults', 'x-systemd.device-timeout=0', 'nodev', 'noexec', 'nosuid'],
     ['defaults', 'x-systemd.device-timeout=0', 'nodev', 'nosuid'], ['defaults', 'x-systemd.device-timeout=0', 'nodev', 'nosuid'], ['defaults', 'x-systemd.device-timeout=0', 'nodev', 'nosuid', 'nodev', 'noexec', 'nosuid'], ['defaults', 'x-systemd.device-timeout=0'],
     ['defaults', 'ro', 'noexec', 'noauto'], ['defaults', 'ro', 'noexec', 'noauto'], ['noexec', 'nosuid', 'nodev'], ['rsize=8192', 'wsize=8192', 'timeo=14', 'intr'] ]
  end

  it 'verify home_mount_options returns something when /home is configured' do
    entries = resource.where { mount_point == '/home' }
    _(entries.configured?).must_equal true
    _(resource.home_mount_options).must_equal [ 'defaults', 'x-systemd.device-timeout=0', 'nodev', 'nosuid']
  end

  it 'verify home_mount_options returns something when /home is not configured' do
    resourceNoHome = load_resource('etc_fstab', 'fstab_no_home')
    entries = resourceNoHome.where { mount_point == '/home' }
    _(entries.configured?).must_equal false
    _(resourceNoHome.home_mount_options).must_be_nil
  end

  it 'verify etc_fstab can detect all nfs file systems' do
    entries = resource.nfs_file_systems
    _(entries.device_name).must_equal ['server:/usr/local/pub']
    _(entries.mount_point).must_equal ['/pub']
    _(entries.file_system_type).must_equal ['nfs']
    _(entries.mount_options).must_equal [['rsize=8192', 'wsize=8192', 'timeo=14', 'intr']]
    _(entries.dump_options).must_equal [0]
    _(entries.file_system_options).must_equal [0]
  end
end
