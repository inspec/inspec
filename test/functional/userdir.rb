# Tests related to interacting with the ~/.inspec userdir


require 'functional/helper'
describe 'user_dir option' do
  include FunctionalHelper

  {
    # User dir option should be accepted by exec, shell, detect
    shell: "shell -c exit",
    # exec: TODO
    detect: " detect",
  }.each do |subcommand, cmd|
    it "works as an option to inspec prior to #{subcommand}" do
      result = inspec("--user-dir #{user_dir_path}/basic " + cmd)
      result.stderr.must_equal ''
      result.exit_status.must_equal 0
    end
    it "works as an option to inspec after #{subcommand}" do
      result = inspec(cmd + " --user-dir #{user_dir_path}/basic")
      result.stderr.must_equal ''
      result.exit_status.must_equal 0
    end
  end

  # TODO: should be able to use a CLI subcommand provided by a plugin in a custom location

  # Pointing it to a nonexistant temp dir should result in exit code 1
  # Empty dir should be OK but not write anything
  # Default location should work
end
