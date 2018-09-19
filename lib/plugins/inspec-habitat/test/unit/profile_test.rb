require 'mixlib/log'
require 'ostruct'
require 'minitest/autorun'
require 'mocha/setup'
require_relative '../../lib/inspec-habitat/profile.rb'

describe InspecPlugins::Habitat::Profile do
  let(:profile) do
    OpenStruct.new(
      name:    'my_profile',
      version: '1.2.3',
      files:   %w(file1 file2)
    )
  end

  let(:subject) { InspecPlugins::Habitat::Profile.new('/path/to/profile', { 'log_level' => 'fatal' }) }

  before do
    Inspec::Log.level(:fatal)
  end

  describe '#verify_profile' do
    it 'exits if the profile is not valid' do
      profile = mock
      profile.stubs(:check).returns(summary: { valid: false })
      subject.expects(:profile).returns(profile)
      proc { subject.send(:verify_profile) }.must_raise SystemExit
    end

    it 'does not exist if the profile is valid' do
      profile = mock
      profile.stubs(:check).returns(summary: { valid: true })
      subject.expects(:profile).returns(profile)
      subject.send(:verify_profile)
    end
  end

  describe '#vendor_profile_dependencies' do
    let(:profile_vendor) do
      profile_vendor = mock
      profile_vendor.stubs(:lockfile).returns(lockfile)
      profile_vendor.stubs(:cache_path).returns(cache_path)
      profile_vendor
    end
    let(:lockfile) { mock }
    let(:cache_path) { mock }

    before do
      Inspec::ProfileVendor.expects(:new).returns(profile_vendor)
    end

    describe 'when lockfile exists and cache dir exists' do
      it 'does not vendor the dependencies' do
        lockfile.expects(:exist?).returns(true)
        cache_path.expects(:exist?).returns(true)
        profile_vendor.expects(:vendor!).never
        profile_vendor.expects(:make_readable).never
        subject.send(:vendor_profile_dependencies)
      end
    end

    describe 'when the lockfile exists but the cache dir does not' do
      it 'vendors the dependencies and refreshes the profile object' do
        lockfile.expects(:exist?).returns(true)
        cache_path.expects(:exist?).returns(false)
        profile_vendor.expects(:vendor!)
        profile_vendor.expects(:make_readable)
        subject.expects(:create_profile_object)

        subject.send(:vendor_profile_dependencies)
      end
    end

    describe 'when the lockfile does not exist' do
      it 'vendors the dependencies and refreshes the profile object' do
        lockfile.expects(:exist?).returns(false)
        profile_vendor.expects(:vendor!)
        profile_vendor.expects(:make_readable)
        subject.expects(:create_profile_object)

        subject.send(:vendor_profile_dependencies)
      end
    end
  end

  describe '#validate_habitat_installed' do
    it 'exits if hab --version fails' do
      cmd = mock
      cmd.stubs(:error?).returns(true)
      cmd.stubs(:run_command)
      cmd.stubs(:stdout)
      cmd.stubs(:stderr)
      Mixlib::ShellOut.expects(:new).with('hab --version').returns(cmd)
      proc { subject.send(:validate_habitat_installed) }.must_raise SystemExit
    end
  end

  describe '#validate_habitat_origin' do
    it 'does not exit if the origin key exists' do
      subject.expects(:habitat_origin).returns('12345')
      subject.send(:validate_habitat_origin)
    end

    it 'exits if no origin key exists' do
      subject.expects(:habitat_origin).returns(nil)
      proc { subject.send(:validate_habitat_origin) }.must_raise SystemExit
    end
  end

  describe '#validate_habitat_auth_token' do
    it 'does not exit if the auth_token exists' do
      subject.expects(:habitat_auth_token).returns('12345')
      subject.send(:validate_habitat_auth_token)
    end

    it 'exits if no auth_token exists' do
      subject.expects(:habitat_auth_token).returns(nil)
      proc { subject.send(:validate_habitat_auth_token) }.must_raise SystemExit
    end
  end

  describe '#build_hart' do
    before do
      subject.expects(:work_dir).at_least_once.returns(Dir.tmpdir)
    end

    it 'exits if the build fails' do
      subject.expects(:system).returns(false)
      proc { subject.send(:build_hart) }.must_raise SystemExit
    end

    it 'exits if more than one hart is created' do
      subject.expects(:system).returns(true)
      Dir.expects(:glob).returns(%w(hart1 hart2))
      proc { subject.send(:build_hart) }.must_raise SystemExit
    end

    it 'exits if more than no hart is created' do
      subject.expects(:system).returns(true)
      Dir.expects(:glob).returns([])
      proc { subject.send(:build_hart) }.must_raise SystemExit
    end

    it 'returns the hart filename' do
      subject.expects(:system).returns(true)
      Dir.expects(:glob).returns(%w(hart1))
      subject.send(:build_hart).must_equal('hart1')
    end
  end

  describe '#upload_hart' do
    it 'exits if the upload failed' do
      env = {
        'TERM'               => 'vt100',
        'HAB_AUTH_TOKEN'     => 'my_token',
        'HAB_NONINTERACTIVE' => 'true',
      }

      cmd = mock
      cmd.stubs(:run_command)
      cmd.stubs(:error?).returns(true)
      cmd.stubs(:stdout)
      cmd.stubs(:stderr)

      subject.expects(:habitat_auth_token).returns('my_token')
      Mixlib::ShellOut.expects(:new).with("hab pkg upload my_hart", env: env).returns(cmd)
      proc { subject.send(:upload_hart, 'my_hart') }.must_raise SystemExit
    end
  end

  describe '#habitat_cli_config' do
    it 'returns an empty hash if the CLI config does not exist' do
      File.expects(:exist?).with(File.join(ENV['HOME'], '.hab', 'etc', 'cli.toml')).returns(false)
      subject.send(:habitat_cli_config).must_equal({})
    end

    it 'returns parsed TOML from the hab config file' do
      config_file = File.join(ENV['HOME'], '.hab', 'etc', 'cli.toml')
      File.expects(:exist?).with(config_file).returns(true)
      Tomlrb.expects(:load_file).with(config_file).returns(foo: 1)
      subject.send(:habitat_cli_config).must_equal(foo: 1)
    end
  end
end
