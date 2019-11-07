require_relative "artifact_helper"

class TestInspecHabitat < Minitest::Test
  parallelize_me!

  def test_habitat
    flunk
    command = "/bin/inspec habitat #{TEST_CLI_OPTS}"
    stdout, stderr, status = Open3.capture3(command)

    assert_empty stderr.sub(/#< CLIXML\n/, "")
    assert stdout
    assert status
  end
end
