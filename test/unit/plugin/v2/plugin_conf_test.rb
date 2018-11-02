require 'minitest/spec'
require 'minitest/autorun'
require 'json'
require 'tmpdir'
require 'byebug'
require_relative '../../../../lib/inspec/plugin/v2'

# This file relies on setting environment variables for some
# of its tests - it is NOT thread-safe.

describe 'Inspec::Plugin::V2::ConfigFile' do
  orig_home = ENV['HOME']

  let(:repo_path) { File.expand_path(File.join( __FILE__, '..', '..', '..', '..', '..')) }
  let(:config_fixtures_path) { File.join(repo_path, 'test', 'unit', 'mock', 'config_dirs') }
  let(:config_file_obj) { Inspec::Plugin::V2::ConfigFile.new(constructor_arg) }
  let(:constructor_arg) { File.join(config_fixtures_path, 'plugin_config_files', fixture_name + '.json') }

  after do
    ENV['HOME'] = orig_home
    ENV['INSPEC_CONFIG_DIR'] = nil
  end

  #----------------------------------------------------------#
  #                     Path Handling
  #----------------------------------------------------------#
  describe 'locating the file' do
    describe 'when no env var is set' do
      let(:constructor_arg) { nil }
      it 'defaults to the home directory' do
        ENV['HOME'] = File.join(config_fixtures_path, 'fakehome')
        expected_path = File.join(ENV['HOME'], '.inspec', 'plugins.json')

        config_file_obj.path.must_equal expected_path
      end
    end

    describe 'when an env var is set' do
      let(:constructor_arg) { nil }
      it 'looks to the dir specified by the env var' do
        ENV['INSPEC_CONFIG_DIR'] = File.join(config_fixtures_path, 'meaning-by-path')
        expected_path = File.join(ENV['INSPEC_CONFIG_DIR'], 'plugins.json')

        config_file_obj.path.must_equal expected_path
      end
    end

    describe 'when a path is provided to the constructor' do
      let(:fixture_name) { 'no_plugins' }
      it 'uses the provided path' do
        config_file_obj.path.must_equal constructor_arg
      end
    end
  end

  #----------------------------------------------------------#
  #                    Reading a File
  #----------------------------------------------------------#

  describe 'reading the file' do

    describe 'when the file is missing' do
      let(:fixture_name) { 'nonesuch' }
      it 'creates a empty datastructure' do
        Dir.mktmpdir do |tmp_dir|
          constructor_arg = File.join(tmp_dir, 'plugins.json')
          config_file_obj.count.must_equal 0
        end
      end
    end

    describe 'when the file is corrupt' do
      let(:fixture_name) { 'corrupt' }
      it 'throws an exception' do
        ex = assert_raises(Inspec::Plugin::V2::ConfigError) { config_file_obj }
        ex.message.must_include('Failed to load')
        ex.message.must_include('JSON')
        ex.message.must_include('unexpected token')
      end
    end

    describe 'when the file is valid' do
      it 'can list plugins' do
        skip
      end
    end

    describe 'when the file is invalid' do

      describe 'because the file version is wrong' do
        let(:fixture_name) { 'bad_plugin_conf_version' }
        it 'throws an exception' do
          ex = assert_raises(Inspec::Plugin::V2::ConfigError) { config_file_obj }
          ex.message.must_include('Unsupported')
          ex.message.must_include('version')
          ex.message.must_include('99.99.9')
          ex.message.must_include('1.0.0')
        end
      end

      describe 'because the file version is missing' do
        let(:fixture_name) { 'missing_plugin_conf_version' }
        it 'throws an exception' do
          ex = assert_raises(Inspec::Plugin::V2::ConfigError) { config_file_obj }
          ex.message.must_include('Missing')
          ex.message.must_include('version')
          ex.message.must_include('1.0.0')
        end
      end

      describe 'because the plugins field is missing' do
        let(:fixture_name) { 'missing_plugins_key' }
        it 'throws an exception' do
          ex = assert_raises(Inspec::Plugin::V2::ConfigError) { config_file_obj }
          ex.message.must_include('missing')
          ex.message.must_include("'plugins'")
          ex.message.must_include('array')
        end
      end

      describe 'because the plugins field is not an array' do
        let(:fixture_name) { 'hash_plugins_key' }
        it 'throws an exception' do
          ex = assert_raises(Inspec::Plugin::V2::ConfigError) { config_file_obj }
          ex.message.must_include('Malformed')
          ex.message.must_include("'plugins'")
          ex.message.must_include('array')
        end
      end

      describe 'because a plugin entry is not a hash' do
        let(:fixture_name) { 'entry_not_hash' }
        it 'throws an exception' do
          ex = assert_raises(Inspec::Plugin::V2::ConfigError) { config_file_obj }
          ex.message.must_include('Malformed')
          ex.message.must_include('Hash')
          ex.message.must_include('at index 2')
        end
      end

      describe 'because a it contains duplicate plugin entries' do
        let(:fixture_name) { 'entry_duplicate' }
        it 'throws an exception' do
          ex = assert_raises(Inspec::Plugin::V2::ConfigError) { config_file_obj }
          ex.message.must_include('Malformed')
          ex.message.must_include('duplicate')
          ex.message.must_include('inspec-test-fixture-01')
          ex.message.must_include('at index 1 and 3')
        end
      end

      describe 'because a plugin entry does not have a name' do
        let(:fixture_name) { 'entry_no_name' }
        it 'throws an exception' do
          ex = assert_raises(Inspec::Plugin::V2::ConfigError) { config_file_obj }
          ex.message.must_include('Malformed')
          ex.message.must_include("missing 'name'")
          ex.message.must_include('at index 1')
        end
      end

      describe 'because a plugin entry has an unrecognized installation type' do
        let(:fixture_name) { 'entry_bad_installation_type' }
        it 'throws an exception' do
          ex = assert_raises(Inspec::Plugin::V2::ConfigError) { config_file_obj }
          ex.message.must_include('Malformed')
          ex.message.must_include('unrecognized installation_type')
          ex.message.must_include("one of 'gem' or 'path'")
          ex.message.must_include('at index 1')
        end
      end

      describe 'because a path plugin entry does not have a path' do
        let(:fixture_name) { 'entry_no_path_for_path_type' }
        it 'throws an exception' do
          ex = assert_raises(Inspec::Plugin::V2::ConfigError) { config_file_obj }
          ex.message.must_include('Malformed')
          ex.message.must_include('missing installation path')
          ex.message.must_include('at index 2')
        end
      end
    end
  end

  describe 'modifying the conf file' do
    describe 'adding an entry' do
      describe 'when the conf is empty' do
        let(:fixture_name) { 'no_plugins' }
        it 'should add one valid entry' do
          skip
        end
      end
      describe 'when the conf has entries' do
        let(:fixture_name) { '' }
        it 'should append one valid entry' do
          skip
        end
      end
      describe 'adding a gem entry' do
        let(:fixture_name) { '' }
        it 'should add a gem entry' do
          skip
        end
      end
      describe 'adding a path entry' do
        let(:fixture_name) { '' }
        it 'should add a path entry' do
          skip
        end
      end
      describe 'adding a duplicate plugin name' do
        let(:fixture_name) { '' }
        it 'should throw an exception' do
          skip
        end
      end
    end

    describe 'removing an entry' do
      describe 'when the entry exists' do
        let(:fixture_name) { '' }
        it 'should remove the entry' do
          skip
        end
      end
      describe 'when the entry does not exist' do
        let(:fixture_name) { '' }
        it 'should do nothing' do
          skip
        end
      end
    end

    describe 'writing the file' do
      describe 'when the file does not exist' do
        let(:fixture_name) { '' }
        it 'is created' do
          skip
        end
      end
      describe 'when the file does exist' do
        let(:fixture_name) { '' }
        it 'is overwritten' do
          skip
        end
      end
    end
  end
end