require_relative "artifact_helper"

class TestInspecSupermarket < Minitest::Test
  def test_supermarket
    skip
    command = "inspec supermarket #{TEST_CLI_OPTS}"
    stdout, stderr, status = Open3.capture3(command)

    assert_empty stderr.sub(/#< CLIXML\n/, "")
    assert stdout
    assert status
  end
end
