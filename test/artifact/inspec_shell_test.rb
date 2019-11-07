require_relative "artifact_helper"
require "open3"

class TestInspecShell < Minitest::Test
  parallelize_me!
  def test_shell
    command = "/bin/inspec shell -c 'os.family' #{TEST_CLI_OPTS}"
    stdout, stderr, status = Open3.capture3(command)

    assert_empty stderr.sub(/#< CLIXML\n/, "")
    assert stdout
    assert status
  end
end
