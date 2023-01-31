require_relative "artifact_helper"

class TestInspecPlugin < ArtifactTest
  def test_plugin_list
    # This one is custom because it emits a special warning to stderr
    inspec_command = "plugin list"
    stdout, stderr, status = run_cmd "inspec #{inspec_command} #{TEST_CLI_OPTS}"
    assert_empty stderr.sub(/#< CLIXML\n/, "").sub(/The table size exceeds the currently set width\.Defaulting to vertical orientation\.\n/, "")
    assert stdout
    assert status
  end
end
