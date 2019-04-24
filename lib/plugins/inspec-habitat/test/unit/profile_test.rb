require 'mixlib/log'
require 'fileutils'
require 'minitest/autorun'
require_relative '../../lib/inspec-habitat/profile.rb'

class InspecPlugins::Habitat::ProfileTest < Minitest::Test
  def setup
    @tmpdir = Dir.mktmpdir

    @output_dir = File.join(@tmpdir, 'output')
    FileUtils.mkdir(@output_dir)

    @fake_hart_file = FileUtils.touch(File.join(@tmpdir, 'fake-hart.hart'))[0]

    # Path from `__FILE__` needed to support running tests in `inspec/inspec`
    @test_profile_path = File.join(
      File.expand_path(File.dirname(__FILE__)),
      '../',
      'support',
      'example_profile'
    )
    @test_profile = Inspec::Profile.for_target(
      @test_profile_path,
      backend: Inspec::Backend.create(Inspec::Config.mock),
    )

    @hab_profile = InspecPlugins::Habitat::Profile.new(
      @test_profile_path,
      { output_dir: @output_dir },
    )

    @mock_hab_config = {
      'auth_token' => 'FAKETOKEN',
      'origin' => 'fake_origin',
    }

    Inspec::Log.level(:fatal)
  end

  def after_run
    FileUtils.remove_entry_secure(@tmpdir)
  end

  def test_create_raises_if_output_dir_does_not_exist
    profile = InspecPlugins::Habitat::Profile.new(
      @test_profile_path,
      {
        output_dir: '/not/a/real/path',
        log_level: 'fatal',
      },
    )

    assert_raises(SystemExit) { profile.create }
    # TODO: Figure out how to capture and validate `Inspec::Log.error`
  end

  def test_create
    file_count = Dir.glob(File.join(@test_profile_path, '**/*')).count

    @hab_profile.stub :read_habitat_config, @mock_hab_config do
      @hab_profile.stub :verify_habitat_setup, nil do
        @hab_profile.stub :build_hart, @fake_hart_file do
          @hab_profile.create
        end
      end
    end

    # It should not modify target profile
    new_file_count = Dir.glob(File.join(@test_profile_path, '**/*')).count
    assert_equal new_file_count, file_count

    # It should create 1 Habitat artifact
    output_files = Dir.glob(File.join(@output_dir, '**/*'))
    assert_equal 1, output_files.count
    assert_equal 'fake-hart.hart', File.basename(output_files.first)
  end

  def test_create_rasies_if_habitat_is_not_installed
    cmd = Minitest::Mock.new
    cmd.expect(:error?, true)
    cmd.expect(:run_command, nil)

    Mixlib::ShellOut.stub :new, cmd, 'hab --version' do
      assert_raises(SystemExit) { @hab_profile.create }
      # TODO: Figure out how to capture and validate `Inspec::Log.error`
    end

    cmd.verify
  end

  def test_upload
    @hab_profile.stub :read_habitat_config, @mock_hab_config do
      @hab_profile.stub :create, @fake_hart_file do
        @hab_profile.stub :upload_hart, nil do
          @hab_profile.upload
          # TODO: Figure out how to capture and validate `Inspec::Log.error`
        end
      end
    end
  end

  def test_upload_raises_if_no_habitat_auth_token_is_found
    @hab_profile.stub :read_habitat_config, {} do
      assert_raises(SystemExit) { @hab_profile.upload }
      # TODO: Figure out how to capture and validate `Inspec::Log.error`
    end
  end

  def test_create_working_dir
    Dir.stub :mktmpdir, '/tmp/fakedir' do
      assert_equal '/tmp/fakedir', @hab_profile.send(:create_working_dir)
    end
  end

  def test_duplicate_profile
    current_profile = @test_profile
    duplicated_profile = @hab_profile.send(:duplicate_profile,
                                           @test_profile_path,
                                           @tmpdir)
    assert duplicated_profile.is_a?(Inspec::Profile)
    assert duplicated_profile.sha256 == current_profile.sha256.to_s
    refute_same duplicated_profile.root_path, current_profile.root_path
  end

  def test_profile_from_path
    profile = @hab_profile.send(:profile_from_path, @test_profile_path)
    assert profile.is_a?(Inspec::Profile)
  end

  def test_copy_profile_to_working_dir
    duplicated_profile = @hab_profile.send(:duplicate_profile,
                                           @test_profile_path,
                                           @tmpdir)

    dst = File.join(@tmpdir, 'working_dir')
    FileUtils.mkdir_p(dst)
    @hab_profile.send(:copy_profile_to_working_dir, duplicated_profile, dst)

    expected_files = %w{
      README.md
      inspec.yml
      example.rb
    }

    actual_files = Dir.glob(File.join(dst, '**/*')).map do |path|
      next unless File.file?(path)
      File.basename(path)
    end.compact

    assert(actual_files.sort == expected_files.sort)
  end

  def test_verify_profile_raises_if_profile_is_not_valid
    bad_profile_path = File.join(@tmpdir, 'bad_profile')
    FileUtils.mkdir_p(File.join(bad_profile_path))
    FileUtils.touch(File.join(bad_profile_path, 'inspec.yml'))
    bad_profile = Inspec::Profile.for_target(
      bad_profile_path,
      backend: Inspec::Backend.create(Inspec::Config.mock),
    )
    assert_raises(SystemExit) { @hab_profile.send(:verify_profile, bad_profile) }
    # TODO: Figure out how to capture and validate `Inspec::Log.error`
  end

  def test_vendor_profile_dependencies_does_not_vendor_if_already_vendored
    mock_lock_file = Minitest::Mock.new
    mock_lock_file.expect(:exist?, true)
    mock_cache_path = Minitest::Mock.new
    mock_cache_path.expect(:exist?, true)

    mock = Minitest::Mock.new
    mock.expect(:lockfile, mock_lock_file)
    mock.expect(:cache_path, mock_cache_path)

    Inspec::ProfileVendor.stub :new, mock do
      new_profile = @hab_profile.send(:vendor_profile_dependencies!,
                                      @test_profile)
      assert new_profile.is_a?(Inspec::Profile)
    end
  end

  def test_vendor_profile_dependencies
    mock_lock_file = Minitest::Mock.new
    mock_lock_file.expect(:exist?, false)

    mock = Minitest::Mock.new
    mock.expect(:lockfile, mock_lock_file)
    mock.expect(:vendor!, nil)
    mock.expect(:make_readable, nil)

    Inspec::ProfileVendor.stub :new, mock do
      new_profile = @hab_profile.send(:vendor_profile_dependencies!,
                                      @test_profile)
      assert new_profile.is_a?(Inspec::Profile)
    end
    mock.verify
  end

  def test_verify_habitat_setup_raises_if_hab_version_errors
    mock = Minitest::Mock.new
    mock.expect(:run_command, nil)
    mock.expect(:error?, true)
    mock.expect(:stderr, 'This would be an error message')

    Mixlib::ShellOut.stub(:new, mock) do
      assert_raises(SystemExit) { @hab_profile.send(:verify_habitat_setup, {}) }
      # TODO: Figure out how to capture and validate `Inspec::Log.error`
    end
    mock.verify
  end

  def test_verify_habitat_setup_raises_if_not_habitat_origin
    mock = Minitest::Mock.new
    mock.expect(:run_command, nil)
    mock.expect(:error?, false)

    Mixlib::ShellOut.stub(:new, mock) do
      assert_raises(SystemExit) { @hab_profile.send(:verify_habitat_setup, {}) }
      # TODO: Figure out how to capture and validate `Inspec::Log.error`
    end
    mock.verify
  end

  # TODO: Figure out how to stub system()
  # def test_build_hart
  # end

  def test_upload_hart_raises_if_hab_pkg_upload_fails
    mock = Minitest::Mock.new
    mock.expect(:run_command, nil)
    mock.expect(:error?, true)
    mock.expect(:stdout, 'This would contain output from `hab`')
    mock.expect(:stderr, 'This would be an error message')

    Mixlib::ShellOut.stub(:new, mock) do
      assert_raises(SystemExit) { @hab_profile.send(:upload_hart, @fake_hart_file, {}) }
      # TODO: Figure out how to capture and validate `Inspec::Log.error`
    end
  end
end
