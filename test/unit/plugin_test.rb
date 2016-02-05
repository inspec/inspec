# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/plugins'
require 'thor'

describe 'plugin system' do

  describe 'with an empty profile' do
    let(:cli_reg) { Inspec::Plugins::CLI }

    it 'is empty' do
      cli_reg.registry.must_equal({})
    end

    it 'stores one cli plugin' do
      plugin = {
        klass: Thor.new,
        subcommand_name: 'my_cmd',
        usage: 'usage my_cmd',
        description: 'desc of my_cmd',
        options: { test: 1 }
      }
      cli_reg.register(
        plugin[:klass],
        plugin[:subcommand_name],
        plugin[:usage],
        plugin[:description],
        plugin[:options]
      )
      cli_reg.registry['my_cmd'].must_equal(plugin)
    end
  end
end
