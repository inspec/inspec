require_relative "artifact_helper"

class TestInspecPlugin < ArtifactTest
  def test_plugin_list
    # This one is custom because it emits a special warning to stderr
    inspec_command = "plugin list"
    stdout, stderr, status = run_cmd "inspec #{inspec_command} #{TEST_CLI_OPTS}"
    filtered_stderr = stderr.sub(/#< CLIXML\n/, "")
    filtered_stderr = filtered_stderr.gsub(/.*warning: assigned but unused variable.*\n?/, "")
    filtered_stderr = filtered_stderr.sub(/The table size exceeds the currently set width\.Defaulting to vertical orientation\.\n/, "")
    assert_empty filtered_stderr
    assert stdout
    assert status
  end
end
