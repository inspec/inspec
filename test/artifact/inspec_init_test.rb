require_relative "artifact_helper"

class TestInspecInit < Minitest::Test
  parallelize_me!

  def test_init
    flunk
    command = "/bin/inspec init #{TEST_CLI_OPTS}"
    stdout, stderr, status = Open3.capture3(command)

    assert_empty stderr.sub(/#< CLIXML\n/, "")
    assert stdout
    assert status
  end
end
