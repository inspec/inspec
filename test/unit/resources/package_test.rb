
require 'helper'
require 'inspec/resource'
require 'inspec/resources/package'

describe 'Inspec::Resources::Package' do
  # arch linux
  it 'verify arch linux package parsing' do
    resource = MockLoader.new(:arch).load_resource('package', 'curl')
    pkg = { name: 'curl', installed: true, version: '7.37.0-1', type: 'pacman' }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '7.37.0-1'
    _(resource.info).must_equal pkg
  end

  # ubuntu
  it 'verify ubuntu package parsing' do
    resource = MockLoader.new(:ubuntu1404).load_resource('package', 'curl')
    pkg = { name: 'curl', installed: true, held: false, version: '7.35.0-1ubuntu2', type: 'deb' }
    _(resource.installed?).must_equal true
    _(resource.held?).must_equal false
    _(resource.version).must_equal '7.35.0-1ubuntu2'
    _(resource.info).must_equal pkg
  end

  it 'verify ubuntu package which is held' do
    resource = MockLoader.new(:ubuntu1404).load_resource('package', 'held-package')
    pkg = { name: 'held-package', installed: true, held: true, version: '1.2.3-1', type: 'deb' }
    _(resource.installed?).must_equal true
    _(resource.held?).must_equal true
    _(resource.version).must_equal '1.2.3-1'
    _(resource.info).must_equal pkg
  end

  # mint
  it 'verify mint package parsing' do
    resource = MockLoader.new(:mint17).load_resource('package', 'curl')
    pkg = { name: 'curl', installed: true, held: false, version: '7.35.0-1ubuntu2', type: 'deb' }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '7.35.0-1ubuntu2'
    _(resource.info).must_equal pkg
  end

  # centos
  describe 'Rpm' do # rubocop:disable BlockLength
    let(:pkg) do
      {
        name: 'curl',
        installed: true,
        version: '7.29.0-19.el7',
        type: 'rpm',
      }
    end

    it 'can parse RPM package info' do
      resource = MockLoader.new(:centos7).load_resource('package', 'curl')
      _(resource.installed?).must_equal true
      _(resource.version).must_equal '7.29.0-19.el7'
      _(resource.info).must_equal pkg
    end

    it 'can build an `rpm` command containing `--dbpath`' do
      resource = MockLoader.new(:centos7).load_resource(
        'package',
        'curl',
        rpm_dbpath: '/var/lib/fake_rpmdb',
      )
      _(resource.installed?).must_equal true
      _(resource.version).must_equal '7.29.0-19.el7'
      _(resource.info).must_equal pkg
    end

    it 'can set `resource_skipped` when `--rpmdb` path does not exist' do
      resource = MockLoader.new(:centos7).load_resource(
        'package',
        'curl',
        rpm_dbpath: '/var/lib/rpmdb_does_not_exist',
      )
      _(resource.resource_skipped?).must_equal true
    end
  end

  # hpux
  it 'verify hpux package parsing' do
    resource = MockLoader.new(:hpux).load_resource('package', 'vim')
    pkg = { name: 'vim', installed: true, version: '7.4', type: 'pkg' }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '7.4'
    _(resource.info).must_equal pkg
  end

  # wrlinux
  it 'verify wrlinux package parsing' do
    resource = MockLoader.new(:wrlinux).load_resource('package', 'curl')
    pkg = { name: 'curl', installed: true, version: '7.29.0-19.el7', type: 'rpm' }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '7.29.0-19.el7'
    _(resource.info).must_equal pkg
  end

  # windows
  it 'verify windows package parsing' do
    resource = MockLoader.new(:windows).load_resource('package', 'Chef Client v12.12.15')
    pkg = { name: 'Chef Client v12.12.15 ', installed: true, version: '12.12.15.1', type: 'windows' }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '12.12.15.1'
    _(resource.info).must_equal pkg
  end

  # solaris 10
  it 'verify solaris 10 package parsing' do
    resource = MockLoader.new(:solaris10).load_resource('package', 'SUNWzfsr')
    pkg = { name: 'SUNWzfsr', installed: true, version: '11.10.0-2006.05.18.01.46', type: 'pkg' }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '11.10.0-2006.05.18.01.46'
    _(resource.info).must_equal pkg
  end

  # solaris 11
  it 'verify solaris 11 package parsing' do
    resource = MockLoader.new(:solaris11).load_resource('package', 'system/file-system/zfs')
    pkg = { name: 'system/file-system/zfs', installed: true, version: '0.5.11-0.175.3.1.0.5.0', type: 'pkg' }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '0.5.11-0.175.3.1.0.5.0'
    _(resource.info).must_equal pkg
  end

  # darwin (brew)
  it 'can parse ouptut from `brew` when package is installed' do
    resource = MockLoader.new(:osx104).load_resource('package', 'curl')
    pkg = { name: 'curl', installed: true, version: '7.52.1', type: 'brew' }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '7.52.1'
    _(resource.info).must_equal pkg
  end

  it 'can parse ouptut from `brew` when package is not installed but exists' do
    resource = MockLoader.new(:osx104).load_resource('package', 'nginx')
    pkg = {}
    _(resource.installed?).must_equal false
    _(resource.version).must_be_nil
    _(resource.info).must_equal pkg
  end

  it 'returns {} when `brew` exits non-zero' do
    resource = MockLoader.new(:osx104).load_resource('package', 'nope')
    pkg = {}
    _(resource.installed?).must_equal false
    _(resource.version).must_be_nil
    _(resource.info).must_equal pkg
  end

  # alpine
  it 'can parse Alpine packages' do
    resource = MockLoader.new(:alpine).load_resource('package', 'git')
    pkg = { name: 'git', installed: true, version: '2.15.0-r1', type: 'pkg' }
    _(resource.installed?).must_equal true
    _(resource.version).must_equal '2.15.0-r1'
    _(resource.info).must_equal pkg
  end

  # undefined
  it 'verify package handling on unsupported os' do
    resource = MockLoader.new(:undefined).load_resource('package', 'curl')
    _(resource.info).must_equal({})
    _(resource.resource_skipped?).must_equal true
    _(resource.resource_exception_message).must_equal 'The `package` resource is not supported on your OS yet.'
  end
end
