require_relative "artifact_helper"
require "open3"

class TestInspecJson < Minitest::Test
  parallelize_me!

  def test_json
    flunk
    # Need a tempdir
    command = "/bin/inspec json #{TEST_CLI_OPTS}"
    stdout, stderr, status = Open3.capture3(command)

    assert_empty stderr.sub(/#< CLIXML\n/, "")
    assert stdout
    assert status
  end
end
