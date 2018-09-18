
# Load test harness - MiniTest
require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/pride'
require 'minitest/spec'

# Data formats commonly used in testing
require 'json'
require 'ostruct'

# Utilities often needed
require 'fileutils'

# Configure MiniTest to expose things like `let`
class Module
  include Minitest::Spec::DSL
end

module CorePluginBaseHelper
  let(:repo_path) { File.expand_path(File.join(__FILE__, '..', '..', '..', '..')) }
  let(:inspec_bin_path) { File.join(repo_path, 'bin', 'inspec') }
  let(:core_mock_path) { File.join(repo_path, 'test', 'unit', 'mock') }
  let(:core_fixture_plugins_path) { File.join(core_mock_path, 'plugins') }
  let(:core_config_dir_path) { File.join(core_mock_path, 'config_dirs') }

  let(:registry) { Inspec::Plugin::V2::Registry.instance }
end

module CorePluginFunctionalHelper
  include CorePluginBaseHelper

  require 'train'
  TRAIN_CONNECTION = Train.create('local', command_runner: :generic).connection

  def run_inspec_process(command_line, env = {})
    env_prefix = env.to_a.map { |assignment| "#{assignment[0]}=#{assignment[1]}" }.join(' ')
    TRAIN_CONNECTION.run_command("#{env_prefix} #{inspec_bin_path} #{command_line}")
  end
end

module CorePluginUnitHelper
  include CorePluginBaseHelper
  require 'inspec'
end
