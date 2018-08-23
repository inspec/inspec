# encoding: utf-8
# copyright: 2017, Chef Software Inc.

require 'helper'
require 'thor'

describe 'BaseCLI' do
  let(:cli) { Inspec::BaseCLI.new }

  describe 'opts' do
    it 'raises if `--password/--sudo-password` are used without value' do
      default_options = { mock: { sudo_password: -1 } }
      Inspec::BaseCLI.stubs(:default_options).returns(default_options)

      e = proc { cli.send(:opts, :mock) }.must_raise(ArgumentError)
      e.message.must_match /Please provide a value for --sudo-password/
    end

    it 'assumes `--sudo` if `--sudo-password` is used without it' do
      default_options = { mock: { sudo_password: 'p@ssw0rd' } }
      Inspec::BaseCLI.stubs(:default_options).returns(default_options)

      opts = {}
      out, err = capture_io do
        cli.send(:opts, :mock)[:sudo].must_equal true
      end
      err.must_match(/WARN: `--sudo-password` used without `--sudo`/)
    end

    it 'calls `Compliance::API.login` if `opts[:compliance] is passed`' do
      default_options = { mock: { compliance: 'mock' } }
      Inspec::BaseCLI.stubs(:default_options).returns(default_options)

      Compliance::API.expects(:login).with('mock')

      cli.send(:opts, :mock)
    end
  end

  describe 'merge_options' do
    let(:default_options) do
      { exec: { 'reporter' => ['json'], 'backend_cache' => false }}
    end

    it 'cli defaults populate correctly' do
      Inspec::BaseCLI.stubs(:default_options).returns(default_options)

      opts = cli.send(:merged_opts, :exec)
      expected = {"backend_cache"=>false, "reporter"=>{"json"=>{"stdout"=>true}}, "type"=>:exec}
      opts.must_equal expected
    end

    it 'verify platform detect' do
      hash = { name: 'test-os', families: 'aws, cloud', release: 'aws-sdk-v1' }
      expect = <<EOF
  Name:      \e[1m\e[35mtest-os\e[0m
  Families:  \e[1m\e[35maws, cloud\e[0m
  Release:   \e[1m\e[35maws-sdk-v1\e[0m
EOF
      _(Inspec::BaseCLI.detect(params: hash, indent: 2, color: 35)).must_equal expect
    end

    it 'json-config options override cli defaults' do
      Inspec::BaseCLI.stubs(:default_options).returns(default_options)

      parsed_json = { 'backend_cache' => true }
      cli.expects(:options_json).returns(parsed_json)

      opts = cli.send(:merged_opts, :exec)
      expected = {"backend_cache"=>true, "reporter"=>{"json"=>{"stdout"=>true}}, "type"=>:exec}
      opts.must_equal expected
    end

    it 'cli options override json-config and default' do
      Inspec::BaseCLI.stubs(:default_options).returns(default_options)

      parsed_json = { 'backend_cache' => false }
      cli.expects(:options_json).returns(parsed_json)

      cli_options = { 'backend_cache' => true }
      cli.instance_variable_set(:@options, cli_options)

      opts = cli.send(:merged_opts, :exec)
      expected = {"backend_cache"=>true, "reporter"=>{"json"=>{"stdout"=>true}}, "type"=>:exec}
      opts.must_equal expected
    end

    it 'make sure shell does not get exec defaults' do
      Inspec::BaseCLI.stubs(:default_options).returns(default_options)

      opts = cli.send(:merged_opts)
      expected = {}
      opts.must_equal expected
    end

    it 'make sure default reporter is overriden by json-config format' do
      default_options['reporter'] = ['cli']
      Inspec::BaseCLI.stubs(:default_options).returns(default_options)
      parsed_json = { 'format' => 'json' }
      cli.expects(:options_json).returns(parsed_json)

      opts = cli.send(:merged_opts, :exec)
      expected = {"backend_cache"=>false, "reporter"=>{"json"=>{"stdout"=>true}}, "type"=>:exec}
      opts.must_equal expected
    end
  end

  describe 'configure_logger' do
    let(:options) do
      o = {
        'log_location' => STDERR,
        'log_level' => 'debug',
        'reporter' => {
          'json' => {
            'stdout' => true,
          },
        },
      }
      Thor::CoreExt::HashWithIndifferentAccess.new(o)
    end
    let(:format) do
      device = options[:logger].instance_variable_get(:"@logdev")
      device.instance_variable_get(:"@dev")
    end

    it 'sets to stderr for log_location' do
      cli.send(:configure_logger, options)
      format.must_equal STDERR
    end

    it 'sets to stderr for json' do
      options.delete('log_location')
      options.delete('log_level')
      cli.send(:configure_logger, options)
      format.must_equal STDERR
    end

    it 'sets defaults to stdout for everything else' do
      options.delete('log_location')
      options.delete('log_level')
      options.delete('reporter')

      cli.send(:configure_logger, options)
      format.must_equal STDOUT
    end
  end

  describe 'parse_reporters' do
    it 'parse cli reporters' do
      opts = { 'reporter' => ['cli'] }
      parsed = Inspec::BaseCLI.parse_reporters(opts)
      assert = { 'reporter' => { 'cli' => { 'stdout' => true }}}
      parsed.must_equal assert
    end

    it 'parse cli reporters with format' do
      opts = { 'format' => 'json' }
      parsed = Inspec::BaseCLI.parse_reporters(opts)
      assert = { 'reporter' => { 'json' => { 'stdout' => true }}}
      parsed.must_equal assert
    end

    it 'parse cli reporters with format and output' do
      error = "[DEPRECATED] The option --format is being deprecated and will be removed in inspec 3.0. Please use --reporter\n"
      error += "[DEPRECATED] The option 'output' is being deprecated and will be removed in inspec 3.0. Please use --reporter name:path\n"
      proc {
        opts = { 'format' => 'json', 'output' => '/tmp/inspec_out.json' }
        parsed = Inspec::BaseCLI.parse_reporters(opts)
        assert = { 'reporter' => { 'json' => { 'file' => '/tmp/inspec_out.json', 'stdout' => false }}}
        parsed.must_equal assert
      }.must_output nil, error end
    end

  describe 'validate_reporters' do
    it 'valid reporter' do
      stdout = { 'stdout' => true }
      reporters = { 'json' => stdout }
      Inspec::BaseCLI.validate_reporters(reporters)
    end

    it 'invalid reporter type' do
      reporters = ['json', 'magenta']
      proc { Inspec::BaseCLI.validate_reporters(reporters) }.must_raise NotImplementedError
    end

    it 'two reporters outputting to stdout' do
      stdout = { 'stdout' => true }
      reporters = { 'json' => stdout, 'cli' => stdout }
      proc { Inspec::BaseCLI.validate_reporters(reporters) }.must_raise ArgumentError
    end
  end

  describe 'suppress_log_output?' do
    it 'suppresses json' do
      opts = { 'reporter' => { 'json' => { 'stdout' => true }}}
      cli.send(:suppress_log_output?, opts).must_equal true
    end

    it 'do not suppresses json-min when going to file' do
      opts = { 'reporter' => { 'json-min' => { 'file' => '/tmp/json' }}}
      cli.send(:suppress_log_output?, opts).must_equal false
    end

    it 'suppresses json-rspec' do
      opts = { 'reporter' => { 'json-rspec' => { 'stdout' => true }}}
      cli.send(:suppress_log_output?, opts).must_equal true
    end

    it 'suppresses json-automate' do
      opts = { 'reporter' => { 'json-automate' => { 'stdout' => true }}}
      cli.send(:suppress_log_output?, opts).must_equal true
    end

    it 'suppresses junit' do
      opts = { 'reporter' => { 'junit' => { 'stdout' => true }}}
      cli.send(:suppress_log_output?, opts).must_equal true
    end

    it 'do not suppresses cli' do
      opts = { 'reporter' => { 'cli' => nil } }
      cli.send(:suppress_log_output?, opts).must_equal false
    end

    it 'do not suppresses cli' do
      opts = { 'reporter' => { 'cli' => nil, 'json' => {'file' => '/tmp/json' }}}
      cli.send(:suppress_log_output?, opts).must_equal false
    end
  end
end
