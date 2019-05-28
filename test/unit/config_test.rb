require 'helper'
require 'stringio'

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

    # TODO: add test for reading from default config path

  end

  # ========================================================================== #
  #                              Global Caching
  # ========================================================================== #

  describe 'caching' do
    # Note that since unit tests are randomized, we have no idea what is in
    # the cache.  We just want to validate that we get the same thing.
    it 'should cache the config object' do
      cfg_1 = Inspec::Config.new # in the unlikely event we are the first unit test

      # Type check
      cfg_cached = Inspec::Config.cached
      cfg_cached.must_be_kind_of Inspec::Config

      # Multiple calls to cached should return the same thing
      cfg_2 = Inspec::Config.cached
      cfg_2.must_equal cfg_cached

      # Cached value unaffected by later instance creation
      cfg_3 = Inspec::Config.new(shoe_size: 9)
      cfg_4 = Inspec::Config.cached
      cfg_4.must_equal cfg_cached
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
        expected = ['reporter', 'type'].sort
        seen_fields.must_equal expected
      end
    end

    describe 'when the file has malformed json' do
      let(:fixture_name) { 'malformed_json' }
      it 'should throw an exception' do
        ex = proc { cfg }.must_raise(Inspec::ConfigError::MalformedJson)
        # Failed to load JSON configuration: 765: unexpected token at '{ "hot_garbage": "a", "version": "1.1",
        # '
        # Config was: "{ \"hot_garbage\": \"a\", \"version\": \"1.1\", \n"
        ex.message.must_include 'Failed to load JSON config'  # The message
        ex.message.must_include 'unexpected token'  # The specific parser error
        ex.message.must_include 'hot_garbage' # A sample of the unacceptable contents
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
        expected = ['color', 'array_value', 'reporter', 'string_key', 'type'].sort
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
        final_options['color'].must_equal "true"  # Dubious - should this be String or TrueClass?
        final_options['target_id'].must_equal 'mynode'
      end
    end

    describe 'when the CLI opts are present in a legacy file' do
      let(:fixture_name) { :legacy }
      it 'should read the options' do
        expected = ['color', 'reporter', 'target_id', 'type'].sort
        seen_fields.must_equal expected
        final_options['color'].must_equal "true"  # Dubious - should this be String or TrueClass?
        final_options['target_id'].must_equal 'mynode'
      end
    end
  end

  # ========================================================================== #
  #                     Parsing and Validating Reporters
  # ========================================================================== #

  # TODO: this should be moved into plugins for the reporters
  describe 'when parsing reporters' do
    let(:cfg) { Inspec::Config.new(cli_opts) }
    let(:seen_reporters) { cfg['reporter'] }

    describe 'when paring CLI reporter' do
      let(:cli_opts) { { 'reporter' => ['cli'] } }
      it 'parse cli reporters' do
        expected_value = { 'cli' => { 'stdout' => true }}
        seen_reporters.must_equal expected_value
      end
    end

    describe 'when paring CLI reporter' do
      let(:cli_opts) { { 'reporter' => ['cli'], 'target_id' => '1d3e399f-4d71-4863-ac54-84d437fbc444' } }
      it 'parses cli report and attaches target_id' do
        expected_value = {"cli"=>{"stdout"=>true, "target_id"=>"1d3e399f-4d71-4863-ac54-84d437fbc444"}}
        seen_reporters.must_equal expected_value
      end
    end
  end

  describe 'when validating reporters' do
    # validate_reporters is private, so we use .send
    let(:cfg) { Inspec::Config.new }
    it 'valid reporter' do
      reporters = { 'json' => { 'stdout' => true } }
      cfg.send(:validate_reporters!, reporters)
    end

    it 'invalid reporter type' do
      reporters = ['json', 'magenta']
      proc { cfg.send(:validate_reporters!, reporters) }.must_raise NotImplementedError
    end

    it 'two reporters outputting to stdout' do
      stdout = { 'stdout' => true }
      reporters = { 'json' => stdout, 'cli' => stdout }
      proc { cfg.send(:validate_reporters!, reporters) }.must_raise ArgumentError
    end
  end

  # ========================================================================== #
  #                      Miscellaneous Option Finalization
  # ========================================================================== #

  describe 'option finalization' do
    it 'raises if `--password/--sudo-password` are used without value' do
      # When you invoke `inspec shell --password`  (with no value for password,
      # though it is setup to expect a string) Thor will set the key with value -1
      ex = proc { Inspec::Config.new({'sudo_password' =>  -1}) }.must_raise(ArgumentError)
      ex.message.must_match(/Please provide a value for --sudo-password/)
    end

    it 'assumes `--sudo` if `--sudo-password` is used without it' do
      @mock_logger = Minitest::Mock.new
      @mock_logger.expect(:warn, nil, [/Adding `--sudo`./])
      Inspec::Log.stub :warn, proc { |message| @mock_logger.warn(message) } do
        cfg = Inspec::Config.new('sudo_password' => 'somepass')
        cfg.key?('sudo').must_equal true
      end
      @mock_logger.verify
    end

    it 'calls `Compliance::API.login` if `opts[:compliance] is passed`' do
      InspecPlugins::Compliance::API.expects(:login)
      cfg_io = StringIO.new(ConfigTestHelper.fixture('with_compliance'))
      Inspec::Config.new({ backend: 'mock' }, cfg_io)
    end
  end
  # ========================================================================== #
  #                           Fetching Credentials
  # ========================================================================== #
  describe 'when fetching creds' do
    let(:cfg) { Inspec::Config.new(cli_opts, cfg_io) }
    let(:cfg_io) { StringIO.new(ConfigTestHelper.fixture(file_fixture_name)) }
    let(:seen_fields) { creds.keys.sort }
    let(:creds) { cfg.unpack_train_credentials }

    describe 'when generic creds are present on the cli' do
      let(:cfg_io) { nil }
      let(:cli_opts) { { sudo: true, 'shell_command': 'ksh' } }
      it 'should pass the credentials as-is' do
        expected = [:backend, :sudo, :shell_command].sort
        seen_fields.must_equal expected
        creds[:sudo].must_equal true
        creds[:shell_command].must_equal 'ksh'
        creds[:backend].must_equal 'local' # Checking for default
      end
    end

    describe 'when creds are specified on the CLI with a backend and transport prefixes' do
      let(:cfg_io) { nil }
      let(:cli_opts) { { backend: 'ssh', ssh_host: 'example.com', ssh_key_files: 'mykey' } }
      it 'should read the backend and strip prefixes' do
        expected = [:backend, :host, :key_files].sort
        seen_fields.must_equal expected
        creds[:backend].must_equal 'ssh'
        creds[:host].must_equal 'example.com'
        creds[:key_files].must_equal 'mykey'
      end
    end

    describe 'when creds are specified with a credset target_uri in a 1.1 file without transport prefixes' do
      let(:file_fixture_name) { :basic }
      let(:cli_opts) { { target: 'ssh://set1' }}
      it 'should use the credset to lookup the creds in the file' do
        expected = [:backend, :host, :user].sort
        seen_fields.must_equal expected
        creds[:backend].must_equal 'ssh'
        creds[:host].must_equal 'some.host'
        creds[:user].must_equal 'some_user'
      end
    end

    describe 'when creds are specified with a credset that contains odd characters' do
      let(:file_fixture_name) { :match_checks_in_credset_names }
      [
        'ssh://TitleCase',
        'ssh://snake_case',
        'ssh://conta1nsnumeral5',
      ].each do |target_uri|
        it "should be able to unpack #{target_uri}" do
          # let() caching breaks things here
          cfg_io = StringIO.new(ConfigTestHelper.fixture(file_fixture_name))
          cli_opts = { target: target_uri }
          cfg = Inspec::Config.new({ target: target_uri }, cfg_io)
          creds = cfg.unpack_train_credentials
          creds.count.must_equal 2
          creds[:backend].must_equal 'ssh'
          creds[:found].must_equal 'yes'
        end
      end

      [
        'ssh://contains.dots',
      ].each do |target_uri|
        it "should handoff unpacking #{target_uri} to train" do
          # let() caching breaks things here
          cfg_io = StringIO.new(ConfigTestHelper.fixture(file_fixture_name))
          cfg = Inspec::Config.new({ target: target_uri }, cfg_io)
          creds = cfg.unpack_train_credentials

          creds.count.must_equal 2
          creds[:backend].must_equal 'ssh'
          creds[:host].must_equal 'contains.dots'
        end
      end

      [
        'ssh://contains spaces',
      ].each do |target_uri|
        it "should be not able to unpack #{target_uri}" do
          # let() caching breaks things here
          cfg_io = StringIO.new(ConfigTestHelper.fixture(file_fixture_name))
          cfg = Inspec::Config.new({ target: target_uri }, cfg_io)

          assert_raises(Train::UserError) { creds = cfg.unpack_train_credentials }
        end
      end
    end

    describe 'when creds are specified with a credset target_uri in a 1.1 file and a prefixed override on the CLI' do
      let(:file_fixture_name) { :basic }
      let(:cli_opts) { { target: 'ssh://set1', ssh_user: 'bob' } }
      it 'should use the credset to lookup the creds in the file then override the single value' do
        expected = [:backend, :host, :user].sort
        seen_fields.must_equal expected
        creds[:backend].must_equal 'ssh'
        creds[:host].must_equal 'some.host'
        creds[:user].must_equal 'bob'
      end
    end

    describe 'when creds are specified with a non-credset target_uri' do
      let(:cfg_io) { nil }
      let(:cli_opts) { { target: 'ssh://bob@somehost' } }
      it 'should unpack the options using the URI parser' do
        expected = [:backend, :host, :user].sort
        seen_fields.must_equal expected
        creds[:backend].must_equal 'ssh'
        creds[:host].must_equal 'somehost'
        creds[:user].must_equal 'bob'
      end
    end

    describe 'when backcompat creds are specified on the CLI without a transport prefix' do
      let(:cfg_io) { nil }
      let(:cli_opts) { { target: 'ssh://some.host', user: 'bob' } }
      it 'should assign the options correctly' do
        expected = [:backend, :host, :user].sort
        seen_fields.must_equal expected
        creds[:backend].must_equal 'ssh'
        creds[:host].must_equal 'some.host'
        creds[:user].must_equal 'bob'
      end
    end
  end

  # ========================================================================== #
  #                             Merging Options
  # ========================================================================== #
  describe 'when merging options' do
    let(:cfg) { Inspec::Config.new(cli_opts, cfg_io, command) }
    let(:cfg_io) { StringIO.new(ConfigTestHelper.fixture(file_fixture_name)) }
    let(:seen_fields) { cfg.final_options.keys.sort }
    let(:command) { nil }

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
        expected = ['reporter', 'target_id', 'type'].sort
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
      let(:cli_opts) { {} }
      let(:command) { :shell } # shell default is [ :cli ]
      let(:file_fixture_name) { :override_check } # This fixture sets the cfg file contents to request a json reporter
      it 'the config file setting should prevail' do
        expected = ['reporter', 'target_id', 'type'].sort
        seen_fields.must_equal expected
        cfg.final_options['reporter'].must_be_kind_of Hash
        cfg.final_options['reporter'].keys.must_equal ['json']
        cfg.final_options['reporter']['json']['path'].must_equal 'path/from/config/file'
        cfg.final_options[:reporter].must_be_kind_of Hash
        cfg.final_options[:reporter].keys.must_equal ['json']
        cfg.final_options[:reporter]['json']['path'].must_equal 'path/from/config/file'
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
            "url": "http://some.where",
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
          "json": {
            "path": "path/from/config/file"
          }
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
      '{ "hot_garbage": "a", "version": "1.1", '
    when :with_compliance
      # TODO - this is dubious, need to verify
      <<~EOJ5
      {
        "compliance": {
          "server":"https://some.host",
          "user":"someuser"
        }
      }
      EOJ5
    when :match_checks_in_credset_names
      <<~EOJ6
      {
        "version": "1.1",
        "credentials": {
          "ssh": {
            "TitleCase": {
              "found": "yes"
            },
            "snake_case": {
              "found": "yes"
            },
            "conta1nsnumeral5": {
              "found": "yes"
            },
            "contains.dots": {
              "found": "no"
            },
            "contains spaces": {
              "found": "no"
            }
          }
        }
      }
      EOJ6
    end
  end
  module_function :fixture
end
