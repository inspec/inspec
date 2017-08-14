# encoding: utf-8
# author: Matthew Dromazos

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

  it 'Verify etc_hosts filtering by `file_system_type`'  do
    entries = resource.where { file_system_type == 'tmpfs' }
    _(entries.mount_point).must_equal ['/dev/shm']
    _(entries.device_name).must_equal ['tmpfs']
    _(entries.mount_options).must_equal [['noexec', 'nosuid' , 'nodev']]
    _(entries.dump_options).must_equal [0]
    _(entries.file_system_options).must_equal [0]
  end

  it 'Verify etc_hosts filtering by `mount_options`'  do
    entries = resource.where { mount_options == ['noexec', 'nosuid' , 'nodev'] }
    _(entries.mount_point).must_equal ['/dev/shm']
    _(entries.file_system_type).must_equal ['tmpfs']
    _(entries.device_name).must_equal ['tmpfs']
    _(entries.dump_options).must_equal [0]
    _(entries.file_system_options).must_equal [0]
  end

  it 'Verify etc_hosts filtering by `dump_options`'  do
    entries = resource.where { dump_options == 0 }
    _(entries.mount_point).must_equal ['/', '/boot', '/home', '/tmp', '/var', '/var/log', '/var/log/audit', 'swap', '/mnt/sr0', '/mnt/cdrom', '/dev/shm', '/pub']
    _(entries.file_system_type).must_equal ['xfs', 'xfs', 'xfs', 'xfs', 'xfs', 'xfs', 'xfs', 'swap', 'iso9660', 'iso9660', 'tmpfs', 'nfs']
    _(entries.mount_options).must_equal [['defaults', 'x-systemd.device-timeout=0'] , ['defaults', 'nodev', 'nosuid'], ['defaults', 'x-systemd.device-timeout=0', 'nodev', 'nosuid'], ['defaults', 'x-systemd.device-timeout=0', 'nodev', 'noexec', 'nosuid'],
     ['defaults', 'x-systemd.device-timeout=0', 'nodev', 'nosuid'], ['defaults', 'x-systemd.device-timeout=0', 'nodev', 'nosuid'], ['defaults', 'x-systemd.device-timeout=0', 'nodev', 'nosuid', 'nodev', 'noexec', 'nosuid'], ['defaults', 'x-systemd.device-timeout=0'],
     ['defaults', 'ro', 'noexec', 'noauto'], ['defaults', 'ro', 'noexec', 'noauto'], ['noexec', 'nosuid', 'nodev'], ['rsize=8192', 'wsize=8192', 'timeo=14', 'intr'] ]
    _(entries.device_name).must_equal ['/dev/mapper/vg1-lv_root', 'UUID=ebffcd01-0695-4d4a-91a4-3a53c6f88d06', '/dev/mapper/vg1-lv_home', '/dev/mapper/vg1-lv_tmp', '/dev/mapper/vg1-lv_var', '/dev/mapper/vg1-lv_log', '/dev/mapper/vg1-lv_audit', '/dev/mapper/vg1-lv_swap',
     '/dev/sr0', '/dev/cdrom', 'tmpfs', 'server:/usr/local/pub']
    _(entries.file_system_options).must_equal [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  end

  it 'Verify etc_hosts filtering by `file_system_options`'  do
    entries = resource.where { file_system_options == 0 }
    _(entries.mount_point).must_equal ['/', '/boot', '/home', '/tmp', '/var', '/var/log', '/var/log/audit', 'swap', '/mnt/sr0', '/mnt/cdrom', '/dev/shm', '/pub']
    _(entries.file_system_type).must_equal ['xfs', 'xfs', 'xfs', 'xfs', 'xfs', 'xfs', 'xfs', 'swap', 'iso9660', 'iso9660', 'tmpfs', 'nfs']
    _(entries.mount_options).must_equal [['defaults', 'x-systemd.device-timeout=0'] , ['defaults', 'nodev', 'nosuid'], ['defaults', 'x-systemd.device-timeout=0', 'nodev', 'nosuid'], ['defaults', 'x-systemd.device-timeout=0', 'nodev', 'noexec', 'nosuid'],
     ['defaults', 'x-systemd.device-timeout=0', 'nodev', 'nosuid'], ['defaults', 'x-systemd.device-timeout=0', 'nodev', 'nosuid'], ['defaults', 'x-systemd.device-timeout=0', 'nodev', 'nosuid', 'nodev', 'noexec', 'nosuid'], ['defaults', 'x-systemd.device-timeout=0'],
     ['defaults', 'ro', 'noexec', 'noauto'], ['defaults', 'ro', 'noexec', 'noauto'], ['noexec', 'nosuid', 'nodev'], ['rsize=8192', 'wsize=8192', 'timeo=14', 'intr'] ]
    _(entries.device_name).must_equal ['/dev/mapper/vg1-lv_root', 'UUID=ebffcd01-0695-4d4a-91a4-3a53c6f88d06', '/dev/mapper/vg1-lv_home', '/dev/mapper/vg1-lv_tmp', '/dev/mapper/vg1-lv_var', '/dev/mapper/vg1-lv_log', '/dev/mapper/vg1-lv_audit', '/dev/mapper/vg1-lv_swap',
     '/dev/sr0', '/dev/cdrom', 'tmpfs', 'server:/usr/local/pub']
    _(entries.dump_options).must_equal [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  end

  it 'verify etc_fstab can detect if a partition is mounted' do
    resource.stubs(:mounted?).with('/home').returns(true)
  end

  it 'verify etc_fstab can detect all removable media file systems' do
    entries = resource.removable_media_file_systems
    _(entries.device_name).must_equal ['/dev/sr0', '/dev/cdrom', 'server:/usr/local/pub']
    _(entries.mount_point).must_equal ['/mnt/sr0', '/mnt/cdrom', '/pub']
    _(entries.file_system_type).must_equal ['iso9660', 'iso9660', 'nfs']
    _(entries.mount_options).must_equal [['defaults', 'ro', 'noexec', 'noauto'], ['defaults', 'ro', 'noexec', 'noauto'], ['rsize=8192', 'wsize=8192', 'timeo=14', 'intr']]
    _(entries.dump_options).must_equal [0, 0, 0]
    _(entries.file_system_options).must_equal [0, 0, 0]
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

  it 'verity etc_fstab can get home directory mount options' do
    _(resource.home_mount_options).must_equal [ 'defaults', 'x-systemd.device-timeout=0', 'nodev', 'nosuid']
  end
end
