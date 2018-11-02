require 'minitest/spec'
require 'minitest/autorun'
require_relative '../../../../lib/inspec/plugin/v2'

# This file relies on setting environment variables for some
# of its tests - it is NOT thread-safe.

describe 'Inspec::Plugin::V2::ConfigFile' do
  orig_home = ENV['HOME']

  let(:repo_path) { File.expand_path(File.join( __FILE__, '..', '..', '..', '..', '..')) }
  let(:config_fixtures_path) { File.join(repo_path, 'test', 'unit', 'mock', 'config_dirs') }
  let(:config_file_obj) { Inspec::Plugin::V2::ConfigFile.new(constructor_arg) }
  let(:constructor_arg) { File.join(config_fixtures_path, 'config_file_obj', fixture_name + '.json') }

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
        ENV['INSPEC_CONFIG_DIR'] = File.join(config_fixtures_path, 'no-plugins')
        expected_path = File.join(ENV['INSPEC_CONFIG_DIR'], 'plugins.json')

        config_file_obj.path.must_equal expected_path
      end
    end

    describe 'when a path is provided to the constructor' do
      let(:fixture_name) { 'no-plugins'}
      it 'uses the provided path' do
        config_file_obj.path.must_equal constructor_arg
      end
    end
  end

  describe 'reading the file' do
    describe 'when the file is missing' do
      it 'creates a empty datastructure' do
        skip
      end
      it 'creates the file on save' do
        skip
      end
    end

    describe 'when the file is corrupt' do
      it 'throws an exception' do
        # ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'corrupt')
        # assert_raises(Inspec::Plugin::V2::ConfigError) { Inspec::Plugin::V2::Loader.new }
        skip
      end
    end

    describe 'when the file is valid' do
      it 'can list plugins' do
        skip
      end
    end

    describe 'when the file is invalid' do
      describe 'because the file version is wrong' do
        it 'throws an exception' do
          # ENV['INSPEC_CONFIG_DIR'] = File.join(@config_dir_path, 'bad_plugin_conf_version')
          # assert_raises(Inspec::Plugin::V2::ConfigError) { Inspec::Plugin::V2::Loader.new }
          skip
        end
      end
      describe 'because the file version is missing' do
        it 'throws an exception' do
          skip
        end
      end
      describe 'because the plugins field is missing' do
        it 'throws an exception' do
          skip
        end
      end
      describe 'because the plugins field is not an array' do
        it 'throws an exception' do
          skip
        end
      end
      describe 'because a plugin entry is not a hash' do
        it 'throws an exception' do
          skip
        end
      end
      describe 'because a plugin entry does not have a name' do
        it 'throws an exception' do
          skip
        end
      end
      describe 'because a plugin entry has an unrecognized installation type' do
        it 'throws an exception' do
          skip
        end
      end
      describe 'because a path plugin entry does not have a path' do
        it 'throws an exception' do
          skip
        end
      end
    end
  end

  describe 'modifying the conf file' do
    describe 'adding an entry' do
      describe 'when the conf is empty' do
        it 'should add one valid entry' do
          skip
        end
      end
      describe 'when the conf has entries' do
        it 'should append one valid entry' do
          skip
        end
      end
      describe 'adding a gem entry' do
        it 'should add a gem entry' do
          skip
        end
      end
      describe 'adding a path entry' do
        it 'should add a path entry' do
          skip
        end
      end
      describe 'adding a duplicate plugin name' do
        it 'should throw an exception' do
          skip
        end
      end
    end

    describe 'removing an entry' do
      describe 'when the entry exists' do
        it 'should remove the entry' do
          skip
        end
      end
      describe 'when the entry does not exist' do
        it 'should do nothing' do
          skip
        end
      end
    end
  end
end