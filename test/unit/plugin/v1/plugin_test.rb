# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# TODO: do not use helper, since all plugins are loaded statically
require 'minitest/autorun'
require 'mocha/setup'

require 'inspec/plugin/v1/plugin_types/cli'
require 'thor'

describe 'plugin system' do
  describe 'with an empty profile' do
    let(:cli_reg) { Inspec::Plugins::CLI }

    before do
      # since the registry is a global singleton, clean it before using
      cli_reg.subcommands.clear
    end

    it 'is empty' do
      cli_reg.subcommands.must_equal({})
    end

    it 'stores one cli plugin' do
      plugin = {
        klass: Thor.new,
        subcommand_name: 'my_cmd',
        usage: 'usage my_cmd',
        description: 'desc of my_cmd',
        options: { test: 1 }
      }
      cli_reg.add_subcommand(
        plugin[:klass],
        plugin[:subcommand_name],
        plugin[:usage],
        plugin[:description],
        plugin[:options]
      )
      cli_reg.subcommands['my_cmd'].must_equal(plugin)
    end
  end
end
