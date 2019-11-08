require_relative "artifact_helper"

class TestInspecExec < Minitest::Test
  def test_exec
    skip
    command = "inspec exec #{TEST_CLI_OPTS}"
    stdout, stderr, status = Open3.capture3(command)

    assert_empty stderr.sub(/#< CLIXML\n/, "")
    assert stdout
    assert status
  end
end
