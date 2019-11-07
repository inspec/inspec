require_relative "artifact_helper"

class TestInspecCheck < Minitest::Test
  parallelize_me!

  def test_check
    flunk
    command = "/bin/inspec check #{TEST_CLI_OPTS}"
    stdout, stderr, status = Open3.capture3(command)

    assert_empty stderr.sub(/#< CLIXML\n/, "")
    assert_match(/Platform Details/, stdout)
    assert status
  end
end
