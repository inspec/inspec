# encoding: utf-8
# copyright: 2017, Chef Software Inc.

require 'helper'
require 'thor'

describe 'BaseCLI' do
  let(:cli) { Inspec::BaseCLI.new }

  describe 'merge_options' do
    it 'json options override cli' do
      json = { "backend_cache":true }
      cli_options = { 'json_config' => 'dummy', 'backend_cache' => false }
      cli.instance_variable_set(:@options, cli_options)
      cli.expects(:read_config).returns(json)

      opts = cli.send(:merged_opts)
      expected = { 'json_config' => 'dummy', 'backend_cache' => true}
      opts.must_equal expected
    end

    it 'cli options merge without json options' do
      cli_options = { 'format' => 'json', 'backend_cache' => true }
      cli.instance_variable_set(:@options, cli_options)

      opts = cli.send(:merged_opts)
      expected = { 'format' => 'json', 'backend_cache' => true }
      opts.must_equal expected
    end
  end
end
