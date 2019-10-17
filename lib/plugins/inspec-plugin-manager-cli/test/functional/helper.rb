require "plugins/shared/core_plugin_test_helper"

module PluginManagerHelpers
  let(:project_repo_path) { File.expand_path(File.join(__FILE__, "..", "..", "..")) }
  let(:project_fixtures_path) { File.join(project_repo_path, "test", "fixtures") }
  let(:project_config_dirs_path) { File.join(project_fixtures_path, "config_dirs") }
  let(:empty_config_dir_path) { File.join(project_config_dirs_path, "empty") }

  let(:list_after_run) do
    Proc.new do |run_result, tmp_dir|
      # After installing/uninstalling/whatevering, run list with config in the same dir, and capture it.
      run_result.payload.list_result = parse_plugin_list_lines(
        run_inspec_process("plugin list", env: { INSPEC_CONFIG_DIR: tmp_dir }).stdout
      )
    end
  end

  def copy_in_project_config_dir(fixture_name, dest = nil)
    src = Dir.glob(File.join(project_config_dirs_path, fixture_name, "*"))
    dest ||= File.join(project_config_dirs_path, "empty")
    src.each { |path| FileUtils.cp_r(path, dest) }
  end

  def copy_in_core_config_dir(fixture_name, dest = nil)
    src = Dir.glob(File.join(core_config_dir_path, fixture_name, "*"))
    dest ||= File.join(project_config_dirs_path, "empty")
    src.each { |path| FileUtils.cp_r(path, dest) }
  end

  def clear_empty_config_dir
    Dir.glob(File.join(project_config_dirs_path, "empty", "*")).each do |path|
      next if path.end_with? ".gitkeep"

      FileUtils.rm_rf(path)
    end
  end

  def parse_plugin_list_lines(stdout)
    plugins = []

    stdout.force_encoding("UTF-8").lines.each do |line|
      next if line.strip.empty?
      next if line.include? "─────" # This is some unicode glyphiness
      next if line.include? "Plugin Name"
      next if line.include? "plugin(s) total"

      parts = line.split(/│/u).map(&:strip!).compact
      plugins << {
        name: parts[0],
        version: parts[1],
        type: parts[2],
        generation: parts[3],
        raw: line,
      }
    end
    plugins
  end

  def teardown
    clear_empty_config_dir
  end
end
