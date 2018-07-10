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

  # Custom location should correctly load values
  # Default location should correctly load

  # Should be able to use INSPEC_CONFIG_DIR env var to load a config
  # Should be able to use INSPEC_CONFIG_DIR env var to load a CLI plugin

  # CLI opts should override config dir config.json opts
  # --json-config should override config dir config.json opts
end
