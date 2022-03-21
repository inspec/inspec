require "plugins/shared/core_plugin_test_helper"

module PluginManagerHelpers
  let(:project_repo_path) { File.expand_path(File.join(__FILE__, "..", "..", "..")) }
  let(:project_fixtures_path) { File.join(project_repo_path, "test", "fixtures") }
  let(:project_config_dirs_path) { File.join(project_fixtures_path, "config_dirs") }
  let(:empty_config_dir_path) { File.join(project_config_dirs_path, "empty") }

  let(:list_after_run) do
    Proc.new do |run_result, tmp_dir|
      # After installing/uninstalling/whatevering, run list with config in the same dir, and capture it.
      result = run_inspec_process("plugin list", env: { INSPEC_CONFIG_DIR: tmp_dir })
      @list_result = parse_plugin_list_lines(
        result.stdout, result.stderr
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

  def parse_plugin_list_lines(stdout, stderr = "")
    plugins = []
    plugin_data = {}

    stdout.force_encoding("UTF-8").lines.each do |line|
      next if line.strip.empty?
      next if line.include? "─────" # This is some unicode glyphiness
      next if line.include? "Plugin Name"
      next if line.include? "plugin(s) total"

      parts = line.split(/│/u).map(&:strip!).compact
      if stderr.match(/vertical orientation/)
        # logic to parse data from vertical view if the ui breaks in existing width
        if line.match(/Plugin/)
          plugin_data = {} # reset this again when one row in vertical view is parsed
          plugin_data[:name] = line.split(" ")[-2]
        elsif line.match(/Version/)
          plugin_data[:version] = parts[1]
        elsif line.match(/Via/)
          plugin_data[:type] = parts[1]
        elsif line.match(/ApiVer/)
          plugin_data[:generation] = parts[1]
        elsif line.match(/Descrip/)
          plugin_data[:description] = parts[1]
          plugins << plugin_data # assuming this will be end of row
        end
      else
        plugins << {
          name: parts[0],
          version: parts[1],
          type: parts[2],
          generation: parts[3],
          description: parts[4],
          raw: line,
        }
      end
    end
    plugins
  end

  def teardown
    clear_empty_config_dir
  end

  # This function exists because under Ruby 2.7 the rubygems gem issues deprecation warnings
  def assert_empty_ignoring_27_warnings(stderr)
    if Gem.ruby_version.segments[0, 2].join(".") == "2.7" # Assuming the deprecations are fixed in 2.8 and later
      # /usr/local/lib/ruby/site_ruby/2.7.0/rubygems.rb:475: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
      # /usr/local/lib/ruby/2.7.0/fileutils.rb:206: warning: The called method `mkdir_p' is defined here
      # /usr/local/lib/ruby/site_ruby/2.7.0/rubygems/package.rb:509: warning: Using the last argument as keyword parameters is deprecated
      # /usr/local/lib/ruby/site_ruby/2.7.0/rubygems/package.rb:489: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
      # /usr/local/lib/ruby/2.7.0/fileutils.rb:180: warning: The called method `mkdir' is defined here"
      stderr = stderr.split("\n").reject { |line| line =~ /(rubygems|fileutils).+warning.+(deprecated|defined)/ }
    end

    assert_empty stderr
  end
end
