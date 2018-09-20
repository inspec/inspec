
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
require 'tmpdir'
require 'pathname'

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

  def run_inspec_process(command_line, opts = {})
    prefix = ''
    if opts.key?(:prefix)
      prefix = opts[:prefix]
    elsif opts.key?(:env)
      prefix = opts[:env].to_a.map { |assignment| "#{assignment[0]}=#{assignment[1]}" }.join(' ')
    end
    TRAIN_CONNECTION.run_command("#{prefix} #{inspec_bin_path} #{command_line}")
  end

  # This helper does some fancy footwork to make InSpec think a plugin
  # under development is temporarily installed.
  def run_inspec_process_with_this_plugin(command_line, opts = {})
    plugin_path = __find_plugin_path_from_caller
    plugin_file_data = __make_plugin_file_data_structure(plugin_path)

    Dir.mktmpdir do |tmp_dir|
      File.write(File.join(tmp_dir, 'plugins.json'), JSON.generate(plugin_file_data))
      opts[:env] ||= {}
      opts[:env]['INSPEC_CONFIG_DIR'] = tmp_dir
      run_inspec_process(command_line, opts)
    end
  end

  def __find_plugin_path_from_caller(frames_back = 2)
    caller_path = Pathname.new(caller_locations(frames_back, 1).first.absolute_path)
    # Typical caller path:
    # /Users/cwolfe/sandbox/inspec-resource-lister/test/functional/inspec_resource_lister_test.rb
    # We want:
    # /Users/cwolfe/sandbox/inspec-resource-lister/lib/inspec-resource-lister.rb
    cursor = caller_path
    until cursor.basename.to_s == 'test' && cursor.parent.basename.to_s =~ /^(inspec|train)-/
      cursor = cursor.parent
      break if cursor.nil?
    end
    raise 'Could not comprehend plugin project directory structure' if cursor.nil?

    project_dir = cursor.parent
    plugin_name = project_dir.basename
    entry_point = File.join(project_dir.to_s, 'lib', plugin_name.to_s + '.rb')
    raise 'Could not find plugin entry point' unless File.exist?(entry_point)
    entry_point
  end

  def __make_plugin_file_data_structure(path)
    # TODO: dry this up, refs #3350
    plugin_name = File.basename(path, '.rb')
    {
      'plugins_config_version' => '1.0.0',
      'plugins' => [
        {
          'name' => plugin_name,
          'installation_type' => 'path',
          'installation_path' => path,
        },
      ],
    }
  end
end

module CorePluginUnitHelper
  include CorePluginBaseHelper
end
