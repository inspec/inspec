require_relative "artifact_helper"
require "open3"

class TestInspecVersion < Minitest::Test
  def test_version
    command = "/bin/inspec version #{TEST_CLI_OPTS}"
    stdout, stderr, status = Open3.capture3(command)

    assert_empty stderr.sub(/#< CLIXML\n/, "")
    assert stdout
    assert status
  end
end
