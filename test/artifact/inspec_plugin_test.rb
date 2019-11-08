require_relative "artifact_helper"

class TestInspecPlugin < Minitest::Test
  def test_plugin
    skip
    command = "inspec plugin #{TEST_CLI_OPTS}"
    stdout, stderr, status = Open3.capture3(command)

    assert_empty stderr.sub(/#< CLIXML\n/, "")
    assert stdout
    assert status
  end
end
