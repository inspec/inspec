require_relative "artifact_helper"

class TestInspecDetect < Minitest::Test
  parallelize_me!

  def test_detect
    command = "/bin/inspec detect --no-color #{TEST_CLI_OPTS}"
    stdout, stderr, status = Open3.capture3(command)

    assert_empty stderr.sub(/#< CLIXML\n/, "")
    assert_match(/Platform Details/, stdout)
    assert status
  end
end
