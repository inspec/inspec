# Tests related to interacting with the ~/.inspec userdir


require 'functional/helper'
describe 'user_dir option' do
  include FunctionalHelper

  {
    # User dir option should be accepted by exec, shell, detect
    shell: "shell -c exit",
    exec: " exec test/unit/mock/profiles/supported_inspec ",
    # plugin: TODO
    detect: " detect",
  }.each do |subcommand, cmd|
    it "works as an option to inspec after #{subcommand}" do
      result = inspec(cmd + " --config-dir #{config_dir_path}/basic --diagnose")
      result.stderr.must_equal ''
      result.exit_status.must_equal 0
    end
  end

  it 'exits with code 1 if the directory does not exist' do
    bad_path = "#{config_dir_path}/nonesuch"
    result = inspec("shell -c 'exit' --config-dir #{bad_path}")
    result.stdout.must_include "No such config directory: '#{bad_path}'"
    result.exit_status.must_equal 1
  end

  it 'should allow an empty dir but not write anything' do
    empty_path = "#{config_dir_path}/empty"
    result = inspec("shell --config-dir #{empty_path} -c 'exit'")
    result.stderr.must_equal ''
    result.stdout.must_equal ''
    result.exit_status.must_equal 0
    Dir.glob(File.join(empty_path, '*')).must_be_empty
  end

  # Default location should correctly load
  it 'should load from the default location' do
    # We don't want to monkey with the CI's idea of homedir, nor the developer's
    home_path = "#{config_dir_path}/fakehome"
    default_path = File.join(home_path, '.inspec.d')
    result = inspec_with_env("shell -c 'exit' --diagnose", 'HOME' => home_path)
    result.stderr.must_equal ''
    merged_config = unpack_merged_config_from_shell_output(result.stdout)
    merged_config['test_marker'].must_equal 'fakehome-01'
    result.exit_status.must_equal 0
  end

  # Custom location should correctly load values
  it "should load values from a custom location" do
    result = inspec("shell --config-dir #{config_dir_path}/basic -c exit --diagnose")
    result.stderr.must_equal ''
    result.exit_status.must_equal 0
    merged_config = unpack_merged_config_from_shell_output(result.stdout)
    merged_config['test_marker'].must_equal 'value_in_basic_confdir'
  end

  it "should allow the CLI options to take precedence over the config file" do
    result = inspec("shell --config-dir #{config_dir_path}/basic -c exit --log-level debug --diagnose")
    result.exit_status.must_equal 0
    merged_config = unpack_merged_config_from_shell_output(result.stdout)
    # Fixture config file sets 'info'
    merged_config['log_level'].must_equal 'debug'
  end

  # --json-config should override config dir config.json opts
  it "should allow the --json-config option to take precedence over the config file" do
    result = inspec("shell --config-dir #{config_dir_path}/basic -c exit --json-config #{config_dir_path}/basic/aux.json --diagnose")
    result.exit_status.must_equal 0
    merged_config = unpack_merged_config_from_shell_output(result.stdout)
    merged_config['test_marker'].must_equal 'value_in_aux_json'
  end

  it "should load values from a custom location via the INSPEC_CONFIG_DIR env variable" do
    result = inspec_with_env("shell -c exit --diagnose", 'INSPEC_CONFIG_DIR' => "#{config_dir_path}/basic")
    result.stderr.must_equal ''
    result.exit_status.must_equal 0
    merged_config = unpack_merged_config_from_shell_output(result.stdout)
    merged_config['test_marker'].must_equal 'value_in_basic_confdir'
  end
  # Should be able to use INSPEC_CONFIG_DIR env var to load a config
  # TODO: Should be able to use INSPEC_CONFIG_DIR env var to load a CLI plugin

  def unpack_merged_config_from_shell_output(out)
    match = out.match(/Merged configuration:\n(.+)$/m)
    return {} unless match
    # Just for fun, the output is not valid JSON, because
    # it is just pretty-printed, and has a symbol in it.
    json_blob = match[1]
    # This quotes the symbol but leaves the colon in place
    json_blob.gsub!(/(:\S+),/,'"\1",')

    # And hash rockets need to be colons
    json_blob.gsub!(/=>/, ':')

    JSON.parse(json_blob)
  end
end
