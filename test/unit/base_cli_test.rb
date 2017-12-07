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
end
