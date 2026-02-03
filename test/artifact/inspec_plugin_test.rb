require_relative "artifact_helper"

class TestInspecPlugin < ArtifactTest
  def test_plugin_list
    # This one is custom because it emits a special warning to stderr
    inspec_command = "plugin list"
    stdout, stderr, status = run_cmd "inspec #{inspec_command} #{TEST_CLI_OPTS}"
    
    # Check for plugin loading errors in stdout (InSpec logs errors to stdout, not stderr)
    refute_match(/ERROR: Could not load plugin/, stdout, 
      "Plugin loading error detected in stdout")
    refute_match(/Unable to activate/, stdout,
      "Gem activation failure detected in stdout")
    
    # Check stderr only for cosmetic warnings
    assert_empty stderr.sub(/#< CLIXML\n/, "").sub(/The table size exceeds the currently set width\.Defaulting to vertical orientation\.\n/, "")
    
    assert stdout
    assert status.success?, "Command failed with exit code #{status.exitstatus}"
  end
end
