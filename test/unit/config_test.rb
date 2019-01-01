
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

    describe 'when the file is a legacy file' do
      let(:fixture_name) { 'legacy' }
      it 'should read the file successfully' do
        # 2 config entries + 'type' flag
        cfg.final_options.count.must_equal 2 + 1
      end
    end

    describe 'when the file is a valid v1.1 file' do
      let(:fixture_name) { 'basic' }
      it 'should read the file successfully' do
        cfg.final_options.count.must_equal 4 + 1
      end
    end

    describe 'when the file is minimal' do
      let(:fixture_name) { 'minimal' }
      it 'should read the file successfully' do
        cfg.final_options.count.must_equal 1 + 1
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

    describe 'when the exec command is used' do
      let(:command) { :exec }
      it 'should have the correct defaults' do
        # final_options adds an entry for 'type'
        final_options.keys.count.must_equal 6+1
        final_options.keys.all? { |option_name| option_name.is_a? String }.must_equal true
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
        final_options.keys.count.must_equal 1+2
        final_options.keys.all? { |option_name| option_name.is_a? String }.must_equal true
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

    describe 'when the CLI opts are present' do
      let(:cli_opts) do
        {
          color: true,
          'string_key' => 'string_value',
          array_value: [1,2,3],
        }
      end

      it 'should transparently round-trip the options' do
        final_options.keys.count.must_equal 3 + 2
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

    describe 'when the CLI opts are present in a 1.1 file' do
    end
    describe 'when the CLI opts are present in a legacy file' do
    end
  end

  # ========================================================================== #
  #                           Fetching Credentials
  # ========================================================================== #
  describe 'when fetching creds' do
  end

  # ========================================================================== #
  #                             Merging Options
  # ========================================================================== #
  describe 'when merging options' do
    describe 'when there is both a default and a config file setting' do
    end

    describe 'when there is both a default and a CLI option' do
    end

    describe 'when there is both a config file setting and a CLI option' do
    end
  end
end

module ConfigTestHelper
  def fixture(fixture_name)
    case fixture_name.to_sym
    when :legacy
      # TODO - this is dubious, but based on https://www.inspec.io/docs/reference/reporters/#automate-reporter
      # Things that have 'compliance' as a toplevel have also been seen
      <<~EOJ1
      {
        "color": "true",
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

# describe 'merge_options' do
#   let(:default_options) do
#     { exec: { 'reporter' => ['json'], 'backend_cache' => false }}
#   end

#   it 'cli defaults populate correctly' do
#     Inspec::BaseCLI.stubs(:default_options).returns(default_options)

#     opts = cli.send(:merged_opts, :exec)
#     expected = {"backend_cache"=>false, "reporter"=>{"json"=>{"stdout"=>true}}, "type"=>:exec}
#     opts.must_equal expected
#   end



#   it 'json-config options override cli defaults' do
#     Inspec::BaseCLI.stubs(:default_options).returns(default_options)

#     parsed_json = { 'backend_cache' => true }
#     cli.expects(:options_json).returns(parsed_json)

#     opts = cli.send(:merged_opts, :exec)
#     expected = {"backend_cache"=>true, "reporter"=>{"json"=>{"stdout"=>true}}, "type"=>:exec}
#     opts.must_equal expected
#   end

#   it 'cli options override json-config and default' do
#     Inspec::BaseCLI.stubs(:default_options).returns(default_options)

#     parsed_json = { 'backend_cache' => false }
#     cli.expects(:options_json).returns(parsed_json)

#     cli_options = { 'backend_cache' => true }
#     cli.instance_variable_set(:@options, cli_options)

#     opts = cli.send(:merged_opts, :exec)
#     expected = {"backend_cache"=>true, "reporter"=>{"json"=>{"stdout"=>true}}, "type"=>:exec}
#     opts.must_equal expected
#   end

#   it 'make sure shell does not get exec defaults' do
#     Inspec::BaseCLI.stubs(:default_options).returns(default_options)

#     opts = cli.send(:merged_opts)
#     expected = {}
#     opts.must_equal expected
#   end

#   it 'make sure default reporter is overriden by json-config reporter' do
#     default_options['reporter'] = ['cli']
#     Inspec::BaseCLI.stubs(:default_options).returns(default_options)

#     parsed_json = { 'reporter' => ['json'] }
#     cli.expects(:options_json).returns(parsed_json)

#     opts = cli.send(:merged_opts, :exec)
#     expected = {"backend_cache"=>false, "reporter"=>{"json"=>{"stdout"=>true}}, "type"=>:exec}
#     opts.must_equal expected
#   end
# end
