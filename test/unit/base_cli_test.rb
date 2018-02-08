# encoding: utf-8
# copyright: 2017, Chef Software Inc.

require 'helper'
require 'thor'

describe 'BaseCLI' do
  let(:cli) { Inspec::BaseCLI.new }

  describe 'merge_options' do
    it 'cli defaults populate correctly' do
      default_options = { exec: { format: 'json', backend_cache: false }}
      Inspec::BaseCLI.stubs(:default_options).returns(default_options)

      opts = cli.send(:merged_opts, :exec)
      expected = { 'format' => 'json', 'backend_cache' => false }
      opts.must_equal expected
    end

    it 'json-config options override cli defaults' do
      default_options = { exec: { format: 'json', backend_cache: false }}
      Inspec::BaseCLI.stubs(:default_options).returns(default_options)

      parsed_json = { 'backend_cache' => true }
      cli.expects(:options_json).returns(parsed_json)

      opts = cli.send(:merged_opts, :exec)
      expected = { 'format' => 'json', 'backend_cache' => true }
      opts.must_equal expected
    end

    it 'cli options override json-config and default' do
      default_options = { exec: { format: 'json', backend_cache: false }}
      Inspec::BaseCLI.stubs(:default_options).returns(default_options)

      parsed_json = { 'backend_cache' => false }
      cli.expects(:options_json).returns(parsed_json)

      cli_options = { 'backend_cache' => true }
      cli.instance_variable_set(:@options, cli_options)

      opts = cli.send(:merged_opts, :exec)
      expected = { 'format' => 'json', 'backend_cache' => true }
      opts.must_equal expected
    end

    it 'make sure shell does not get exec defaults' do
      default_options = { exec: { format: 'json', backend_cache: false }}
      Inspec::BaseCLI.stubs(:default_options).returns(default_options)

      opts = cli.send(:merged_opts)
      expected = {}
      opts.must_equal expected
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
