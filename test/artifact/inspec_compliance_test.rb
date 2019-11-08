require_relative "artifact_helper"

class TestInspecCompliance < Minitest::Test
  def test_compliance_version
    command = "/bin/inspec compliance version #{TEST_CLI_OPTS}"
    stdout, stderr, status = Open3.capture3(command)

    assert_empty stderr.sub(/#< CLIXML\n/, "")
    assert stdout
    assert status
  end
end
