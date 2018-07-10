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

  # Pointing it to a nonexistant temp dir should result in exit code 1
  # Empty dir should be OK but not write anything
  # Custom location should correctly load values
  # Default location should correctly load

  # Should be able to use INSPEC_CONFIG_DIR env var to load a config
  # Should be able to use INSPEC_CONFIG_DIR env var to load a CLI plugin
end
