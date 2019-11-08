require_relative "artifact_helper"

class TestInspecShell < Minitest::Test
  def test_shell
    command = "inspec shell -c 'os.family' #{TEST_CLI_OPTS}"
    stdout, stderr, status = Open3.capture3(command)

    assert_empty stderr.sub(/#< CLIXML\n/, "")
    assert stdout
    assert status
  end
end
