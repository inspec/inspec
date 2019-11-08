require_relative "artifact_helper"

class TestInspecJson < Minitest::Test
  def test_json
    skip
    # Need a tempdir
    command = "/bin/inspec json #{TEST_CLI_OPTS}"
    stdout, stderr, status = Open3.capture3(command)

    assert_empty stderr.sub(/#< CLIXML\n/, "")
    assert stdout
    assert status
  end
end
