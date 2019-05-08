# Load test harness - Minitest
require 'minitest/autorun'
require 'minitest/pride'

# Data formats commonly used in testing
require 'json'
require 'ostruct'

# Utilities often needed
require 'fileutils'
require 'tmpdir'
require 'pathname'
require 'forwardable'

# Configure Minitest to expose things like `let`
class Module
  include Minitest::Spec::DSL
end

module Inspec
  class FuncTestRunResult
    attr_reader :train_result
    attr_reader :payload

    extend Forwardable
    def_delegator :train_result, :stdout
    def_delegator :train_result, :stderr
    def_delegator :train_result, :exit_status

    def initialize(train_result)
      @train_result = train_result
      @payload = OpenStruct.new
    end
  end
end

module CorePluginBaseHelper
  let(:repo_path) { File.expand_path(File.join(__FILE__, '..', '..', '..', '..')) }
  let(:inspec_bin_path) { File.join(repo_path, 'inspec-bin', 'bin', 'inspec') }
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
    Inspec::FuncTestRunResult.new(TRAIN_CONNECTION.run_command("#{prefix} #{inspec_bin_path} #{command_line}"))
  end

  # This helper does some fancy footwork to make InSpec think a plugin
  # under development is temporarily installed.
  # @param String command_line Invocation, without the word 'inspec'
  # @param Hash opts options as for run_inspec_process, with more options:
  #    :pre_run: Proc(plugin_statefile_data, tmp_dir_path) - optional setup block.
  #       Modify plugin_statefile_data as needed; it will be written to a plugins.json
  #       in tmp_dir_path.  You may also copy in other things to the tmp_dir_path. Your PWD
  #       will be in the tmp_dir, and it will exist and be empty.
  #    :post_run: Proc(FuncTestRunResult, tmp_dir_path) - optional result capture block.
  #       run_result will be populated, but you can add more to the ostruct .payload
  #       Your PWD will be the tmp_dir, and it will still exist (for a moment!)
  def run_inspec_process_with_this_plugin(command_line, opts = {})
    plugin_path = __find_plugin_path_from_caller

    # If it looks like it is a core plugin under test, don't add it to the plugin file
    # since the loader will auto-load it anyway
    if plugin_path.include?('lib/plugins/inspec-')
      plugin_file_data = __make_empty_plugin_file_data_structure
    else
      plugin_file_data = __make_plugin_file_data_structure_with_path(plugin_path)
    end

    Dir.mktmpdir do |tmp_dir|
      opts[:pre_run]&.call(plugin_file_data, tmp_dir)
      plugin_file_path = File.join(tmp_dir, 'plugins.json')
      # HACK: If the block cleared the hash, take that to mean it will provide a plugins.json file of its own.
      File.write(plugin_file_path, JSON.generate(plugin_file_data)) unless plugin_file_data.empty?
      opts[:env] ||= {}
      opts[:env]['INSPEC_CONFIG_DIR'] = tmp_dir
      run_result = run_inspec_process(command_line, opts)

      # Read the resulting plugins.json into memory, if any
      if File.exist?(plugin_file_path)
        run_result.payload.plugin_data = JSON.parse(File.read(plugin_file_path))
      end

      opts[:post_run]&.call(run_result, tmp_dir)
      run_result
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

  def __make_plugin_file_data_structure_with_path(path)
    # TODO: dry this up, refs #3350
    plugin_name = File.basename(path, '.rb')
    data = __make_empty_plugin_file_data_structure
    data['plugins'] << {
      'name' => plugin_name,
      'installation_type' => 'path',
      'installation_path' => path,
    }
    data
  end

  def __make_empty_plugin_file_data_structure
    # TODO: dry this up, refs #3350
    {
      'plugins_config_version' => '1.0.0',
      'plugins' => [],
    }
  end
end

module CorePluginUnitHelper
  include CorePluginBaseHelper
end
