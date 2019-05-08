require 'minitest/autorun'
require 'tmpdir'
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
      let(:fixture_name) { 'basic' }
      it 'can count plugins' do
        config_file_obj.count.must_equal 3
      end
      it 'can look up plugins by name with a String' do
        config_file_obj.plugin_by_name('inspec-test-fixture-01').wont_be_nil
        config_file_obj.plugin_by_name('inspec-test-fixture-99').must_be_nil
      end
      it 'can look up plugins by name with a Symbol' do
        config_file_obj.plugin_by_name(:'inspec-test-fixture-01').wont_be_nil
        config_file_obj.plugin_by_name(:'inspec-test-fixture-99').must_be_nil
      end
      it 'symbolizes the keys of the entries' do
        config_file_obj.each do |entry|
          entry.keys.each do |key|
            key.must_be_kind_of(Symbol)
          end
        end
      end
      it 'implements Enumerable' do
        config_file_obj.select { |entry| entry[:name].to_s.start_with?('inspec-test-fixture') }.count.must_equal 3
      end
    end

    #----------------------------------------------------------#
    #                     Validation
    #----------------------------------------------------------#
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

      describe 'because it contains duplicate plugin entries' do
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
    #----------------------------------------------------------#
    #                     Adding Entries
    #----------------------------------------------------------#
    describe 'adding an entry' do
      let(:fixture_name) { 'no_plugins' }

      describe 'when the conf is empty' do
        it 'should add one valid entry' do
          config_file_obj.count.must_equal 0
          config_file_obj.add_entry(name: 'inspec-test-fixture')
          config_file_obj.count.must_equal 1
          config_file_obj.plugin_by_name(:'inspec-test-fixture').wont_be_nil
        end
      end

      describe 'when the conf has entries' do
        let(:fixture_name) { 'basic' }
        it 'should append one valid entry' do
          config_file_obj.count.must_equal 3
          config_file_obj.add_entry(name: 'inspec-test-fixture-03')
          config_file_obj.count.must_equal 4
          config_file_obj.plugin_by_name(:'inspec-test-fixture-03').wont_be_nil
        end
      end

      describe 'when adding a gem entry' do
        it 'should add a gem entry' do
          config_file_obj.add_entry(
            name: 'inspec-test-fixture-03',
            installation_type: :gem,
          )
          entry = config_file_obj.plugin_by_name(:'inspec-test-fixture-03')
          entry.wont_be_nil
          entry[:installation_type].must_equal :gem
        end
      end

      describe 'when adding a path entry' do
        it 'should add a path entry' do
          config_file_obj.add_entry(
            name: 'inspec-test-fixture-03',
            installation_type: :path,
            installation_path: '/my/path.rb',
          )
          entry = config_file_obj.plugin_by_name(:'inspec-test-fixture-03')
          entry.wont_be_nil
          entry[:installation_type].must_equal :path
          entry[:installation_path].must_equal '/my/path.rb'
        end
      end

      describe 'when adding a duplicate plugin name' do
        let(:fixture_name) { 'basic' }
        it 'should throw an exception' do
          assert_raises(Inspec::Plugin::V2::ConfigError) { config_file_obj.add_entry(name: 'inspec-test-fixture-02') }
        end
      end

      describe 'when adding an invalid entry' do
        it 'should throw an exception' do
          [
            { name: 'inspec-test-fixture', installation_type: :path },
            {                                 installation_type: :gem },
            { name: 'inspec-test-fixture', installation_type: :invalid },
            { 'name' => 'inspec-test-fixture' },
          ].each do |proposed_entry|
            assert_raises(Inspec::Plugin::V2::ConfigError) { config_file_obj.add_entry(proposed_entry) }
          end
        end
      end
    end

    #----------------------------------------------------------#
    #                     Removing Entries
    #----------------------------------------------------------#
    describe 'removing an entry' do
      let(:fixture_name) { 'basic' }

      describe 'when the entry exists' do
        it 'should remove the entry by symbol name' do
          config_file_obj.count.must_equal 3
          config_file_obj.plugin_by_name(:'inspec-test-fixture-01').wont_be_nil
          config_file_obj.remove_entry(:'inspec-test-fixture-01')
          config_file_obj.count.must_equal 2
          config_file_obj.plugin_by_name(:'inspec-test-fixture-01').must_be_nil
        end
        it 'should remove the entry by String name' do
          config_file_obj.count.must_equal 3
          config_file_obj.plugin_by_name('inspec-test-fixture-01').wont_be_nil
          config_file_obj.remove_entry('inspec-test-fixture-01')
          config_file_obj.count.must_equal 2
          config_file_obj.plugin_by_name('inspec-test-fixture-01').must_be_nil
        end
      end

      describe 'when the entry does not exist' do
        let(:fixture_name) { 'basic' }
        it 'should throw an exception' do
          config_file_obj.count.must_equal 3
          config_file_obj.plugin_by_name(:'inspec-test-fixture-99').must_be_nil
          ex = assert_raises(Inspec::Plugin::V2::ConfigError) { config_file_obj.remove_entry(:'inspec-test-fixture-99') }
          ex.message.must_include 'No such entry'
          ex.message.must_include 'inspec-test-fixture-99'
          config_file_obj.count.must_equal 3
        end
      end
    end

    describe 'writing the file' do
      let(:fixture_name) { 'unused' }

      describe 'when the file does not exist' do
        it 'is created' do
          Dir.mktmpdir do |tmp_dir|
            path = File.join(tmp_dir, 'plugins.json')
            File.exist?(path).must_equal false
            cfo_writer = Inspec::Plugin::V2::ConfigFile.new(path)
            cfo_writer.add_entry(name: :'inspec-resource-lister')
            cfo_writer.save

            File.exist?(path).must_equal true
            cfo_reader = Inspec::Plugin::V2::ConfigFile.new(path)
            cfo_reader.existing_entry?(:'inspec-resource-lister').must_equal true
          end
        end
      end

      describe 'when the directory does not exist' do
        it 'is created' do
          Dir.mktmpdir do |tmp_dir|
            path = File.join(tmp_dir, 'subdir', 'plugins.json')
            File.exist?(path).must_equal false
            cfo_writer = Inspec::Plugin::V2::ConfigFile.new(path)
            cfo_writer.add_entry(name: :'inspec-resource-lister')
            cfo_writer.save

            File.exist?(path).must_equal true
            cfo_reader = Inspec::Plugin::V2::ConfigFile.new(path)
            cfo_reader.existing_entry?(:'inspec-resource-lister').must_equal true
          end
        end
      end

      describe 'when the file does exist' do
        it 'is overwritten' do
          Dir.mktmpdir do |tmp_dir|
            path = File.join(tmp_dir, 'plugins.json')
            cfo_writer = Inspec::Plugin::V2::ConfigFile.new(path)
            cfo_writer.add_entry(name: :'inspec-resource-lister')
            cfo_writer.save

            File.exist?(path).must_equal true

            cfo_modifier = Inspec::Plugin::V2::ConfigFile.new(path)
            cfo_modifier.remove_entry(:'inspec-resource-lister')
            cfo_modifier.add_entry(name: :'inspec-test-fixture')
            cfo_modifier.save

            cfo_reader = Inspec::Plugin::V2::ConfigFile.new(path)
            cfo_reader.existing_entry?(:'inspec-resource-lister').must_equal false
            cfo_reader.existing_entry?(:'inspec-test-fixture').must_equal true
          end
        end
      end
    end
  end
end
