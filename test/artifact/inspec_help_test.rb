require_relative "artifact_helper"
require "open3"

class TestInspecHelp < Minitest::Test
  parallelize_me!
  def test_help
    command = "/bin/inspec help #{TEST_CLI_OPTS}"
    stdout, stderr, status = Open3.capture3(command)

    assert_empty stderr.sub(/#< CLIXML\n/, "")
    assert stdout
    assert status
  end
end
