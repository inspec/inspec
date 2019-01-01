
require 'helper'
require 'stringio'
require 'byebug'

require 'inspec/config'

describe 'Inspec::Config' do

  # ========================================================================== #
  #                                Constructor
  # ========================================================================== #
  describe 'the constructor' do
    describe 'when no args are provided' do
      it 'should initialize properly' do
        cfg = Inspec::Config.new
        cfg.must_respond_to :final_options
      end
    end

    describe 'when CLI args are provided' do
      it 'should initialize properly' do
        cfg = Inspec::Config.new({color: true, log_level: 'warn'})
        cfg.must_respond_to :final_options
      end
    end
  end

  # ========================================================================== #
  #                              File Validation
  # ========================================================================== #
  describe 'when validating a file' do
    let(:cfg) { Inspec::Config.new({}, cfg_io) }
    let(:cfg_io) { StringIO.new(ConfigTestHelper.fixture(fixture_name)) }
    let(:seen_fields) { cfg.final_options.keys.sort }

    describe 'when the file is a legacy file' do
      let(:fixture_name) { 'legacy' }
      it 'should read the file successfully' do
        expected = ['color', 'reporter', 'target_id', 'type'].sort
        seen_fields.must_equal expected
      end
    end

    describe 'when the file is a valid v1.1 file' do
      let(:fixture_name) { 'basic' }
      it 'should read the file successfully' do
        expected = ['create_lockfile', 'reporter', 'type'].sort
        seen_fields.must_equal expected
      end
    end

    describe 'when the file is minimal' do
      let(:fixture_name) { 'minimal' }
      it 'should read the file successfully' do
        expected = ['type'].sort
        seen_fields.must_equal expected
      end
    end

    describe 'when the file has malformed json' do
      let(:fixture_name) { 'malformed_json' }
      it 'should throw an exception' do
        ex = proc { cfg }.must_raise(Inspec::ConfigError::MalformedJson)
        ex.message.must_include 'Failed to load JSON config'
        ex.message.must_include 'unexpected token'
        ex.message.must_include 'version'
      end
    end

    describe 'when the file has a bad file version' do
      let(:fixture_name) { 'bad_version' }
      it 'should throw an exception' do
        ex = proc { cfg }.must_raise(Inspec::ConfigError::Invalid)
        ex.message.must_include 'Unsupported config file version'
        ex.message.must_include '99.99'
        ex.message.must_include '1.1'
      end
    end

    describe 'when a 1.1 file has an invalid top-level entry' do
      let(:fixture_name) { 'bad_top_level' }
      it 'should throw an exception' do
        ex = proc { cfg }.must_raise(Inspec::ConfigError::Invalid)
        ex.message.must_include 'Unrecognized top-level'
        ex.message.must_include 'unsupported_field'
        ex.message.must_include 'compliance'
      end
    end
  end

  # ========================================================================== #
  #                                 Defaults
  # ========================================================================== #
  describe 'reading defaults' do
    let(:cfg) { Inspec::Config.new({}, nil, command) }
    let(:final_options) { cfg.final_options }
    let(:seen_fields) { cfg.final_options.keys.sort }

    describe 'when the exec command is used' do
      let(:command) { :exec }
      it 'should have the correct defaults' do
        expected = ['color', 'create_lockfile', 'backend_cache', 'reporter', 'show_progress', 'type'].sort
        seen_fields.must_equal expected
        final_options['reporter'].must_be_kind_of Hash
        final_options['reporter'].count.must_equal 1
        final_options['reporter'].keys.must_include 'cli'
        final_options['show_progress'].must_equal false
        final_options['color'].must_equal true
        final_options['create_lockfile'].must_equal true
        final_options['backend_cache'].must_equal true
      end
    end

    describe 'when the shell command is used' do
      let(:command) { :shell }
      it 'should have the correct defaults' do
        expected = ['reporter', 'type'].sort
        seen_fields.must_equal expected
        final_options['reporter'].must_be_kind_of Hash
        final_options['reporter'].count.must_equal 1
        final_options['reporter'].keys.must_include 'cli'
      end
    end
  end

  # ========================================================================== #
  #                            Reading CLI Options
  # ========================================================================== #
  # The config facility supports passing in CLI options in the constructor, so
  # that it can handle merging internally. That is tested here.
  #
  #  This is different than storing options
  # in the config file with the same name as the CLI options, which is
  # tested under 'CLI Options Stored in File'
  describe 'reading CLI options' do
    let(:cfg) { Inspec::Config.new(cli_opts) }
    let(:final_options) { cfg.final_options }
    let(:seen_fields) { cfg.final_options.keys.sort }

    describe 'when the CLI opts are present' do
      let(:cli_opts) do
        {
          color: true,
          'string_key' => 'string_value',
          array_value: [1,2,3],
        }
      end

      it 'should transparently round-trip the options' do
        expected = ['color', 'array_value', 'string_key', 'type'].sort
        seen_fields.must_equal expected
        final_options[:color].must_equal true
        final_options['color'].must_equal true
        final_options['string_key'].must_equal 'string_value'
        final_options[:string_key].must_equal 'string_value'
        final_options['array_value'].must_equal [1,2,3]
        final_options[:array_value].must_equal [1,2,3]
      end
    end
  end

  # ========================================================================== #
  #                          CLI Options Stored in File
  # ========================================================================== #
  describe 'reading CLI options stored in the config file' do
    let(:cfg) { Inspec::Config.new({}, cfg_io) }
    let(:final_options) { cfg.final_options }
    let(:cfg_io) { StringIO.new(ConfigTestHelper.fixture(fixture_name)) }
    let(:seen_fields) { cfg.final_options.keys.sort }

    # These two test cases have the same options but in different file versions.
    describe 'when the CLI opts are present in a 1.1 file' do
      let(:fixture_name) { :like_legacy }
      it 'should read the options' do
        expected = ['color', 'reporter', 'target_id', 'type'].sort
        seen_fields.must_equal expected
        final_options['color'].must_equal "true"  # Dubious
        final_options['target_id'].must_equal 'mynode'
      end
    end

    describe 'when the CLI opts are present in a legacy file' do
      let(:fixture_name) { :legacy }
      it 'should read the options' do
        expected = ['color', 'reporter', 'target_id', 'type'].sort
        seen_fields.must_equal expected
        final_options['color'].must_equal "true"  # Dubious
        final_options['target_id'].must_equal 'mynode'
      end
    end
  end

  # ========================================================================== #
  #                           Fetching Credentials
  # ========================================================================== #
  describe 'when fetching creds' do
      # TODO
  end

  # ========================================================================== #
  #                             Merging Options
  # ========================================================================== #
  describe 'when merging options' do
    let(:cfg) { Inspec::Config.new(cli_opts, cfg_io) }
    let(:cfg_io) { StringIO.new(ConfigTestHelper.fixture(file_fixture_name)) }
    let(:seen_fields) { cfg.final_options.keys.sort }

    describe 'when there is both a default and a config file setting' do
      let(:file_fixture_name) { :override_check }
      let(:cli_opts) { {} }
      it 'the config file setting should prevail' do
        Inspec::Config::Defaults.stubs(:default_for_command).returns('target_id'=> 'value_from_default')
        expected = ['reporter', 'target_id', 'type'].sort
        seen_fields.must_equal expected
        cfg.final_options['target_id'].must_equal 'value_from_config_file'
        cfg.final_options[:target_id].must_equal 'value_from_config_file'
      end
    end

    describe 'when there is both a default and a CLI option' do
      let(:cli_opts) { { target_id: 'value_from_cli_opts' } }
      let(:cfg_io) { nil }
      it 'the CLI option should prevail' do
        Inspec::Config::Defaults.stubs(:default_for_command).returns('target_id'=> 'value_from_default')
        expected = ['target_id', 'type'].sort
        seen_fields.must_equal expected
        cfg.final_options['target_id'].must_equal 'value_from_cli_opts'
        cfg.final_options[:target_id].must_equal 'value_from_cli_opts'
      end
    end

    describe 'when there is both a config file setting and a CLI option' do
      let(:file_fixture_name) { :override_check }
      let(:cli_opts) { { target_id: 'value_from_cli_opts' } }
      it 'the CLI option should prevail' do
        expected = ['reporter', 'target_id', 'type'].sort
        seen_fields.must_equal expected
        cfg.final_options['target_id'].must_equal 'value_from_cli_opts'
        cfg.final_options[:target_id].must_equal 'value_from_cli_opts'
      end
    end

    describe 'specifically check default vs config file override for "reporter" setting' do
      let(:file_fixture_name) { :override_check }
      let(:cli_opts) { {} }
      it 'the config file setting should prevail' do
        Inspec::Config::Defaults.stubs(:default_for_command).returns('reporter' => { 'csv' => 'value_from_default'})
        expected = ['reporter', 'target_id', 'type'].sort
        seen_fields.must_equal expected
        cfg.final_options['reporter'].must_be_kind_of Hash
        cfg.final_options['reporter'].keys.must_equal ['json']
        cfg.final_options['reporter']['json'].must_equal 'path/from/config/file'
        cfg.final_options[:reporter].must_be_kind_of Hash
        cfg.final_options[:reporter].keys.must_equal ['json']
        cfg.final_options[:reporter]['json'].must_equal 'path/from/config/file'
      end
    end
  end
end


# ========================================================================== #
#                              Test Fixtures
# ========================================================================== #

module ConfigTestHelper
  def fixture(fixture_name)
    case fixture_name.to_sym
    when :legacy
      # TODO - this is dubious, but based on https://www.inspec.io/docs/reference/reporters/#automate-reporter
      # Things that have 'compliance' as a toplevel have also been seen
      <<~EOJ1
      {
        "color": "true",
        "target_id": "mynode",
        "reporter": {
          "automate" : {
            "url" : "https://YOUR_A2_URL/data-collector/v0/",
            "token" : "YOUR_A2_ADMIN_TOKEN"
          }
        }
      }
      EOJ1
    when :basic
      <<~EOJ2
      {
        "version": "1.1",
        "cli_options": {
          "create_lockfile": "false"
        },
        "reporter": {
          "automate" : {
            "token" : "YOUR_A2_ADMIN_TOKEN"
          }
        },
        "credentials": {
          "ssh": {
            "set1": {
              "host": "some.host",
              "user": "some_user"
            }
          }
        }
      }
      EOJ2
    when :like_legacy
      <<~EOJ3
      {
        "version": "1.1",
        "cli_options": {
          "color": "true",
          "target_id": "mynode"
        },
        "reporter": {
          "automate" : {
            "url" : "https://YOUR_A2_URL/data-collector/v0/",
            "token" : "YOUR_A2_ADMIN_TOKEN"
          }
        }
      }
      EOJ3
    when :override_check
      <<~EOJ4
      {
        "version": "1.1",
        "cli_options": {
          "target_id": "value_from_config_file"
        },
        "reporter": {
          "json": "path/from/config/file"
        }
      }
      EOJ4
    when :minimal
      '{ "version": "1.1" }'
    when :bad_version
      '{ "version": "99.99" }'
    when :bad_top_level
      '{ "version": "1.1", "unsupported_field": "some_value" }'
    when :malformed_json
      '{ "version": "1.1", '
    end
  end
  module_function :fixture
end
