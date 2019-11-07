require_relative "artifact_helper"

class TestArtifactInstallation < Minitest::Test
  parallelize_me!

  def test_inspec_exists_linux
    skip if windows?
    stdout, stderr, status = Open3.capture3("/usr/bin/which inspec")
    refute_match(/no inspec/, stdout)
    assert_empty stderr
    assert status
  end

  def test_inspec_exists_windows
    skip unless windows?
    stdout, stderr, status = Open3.capture3("Get-Command inspec")
    assert_match(/inspec.bat/, stdout)
    assert_empty stderr
    assert status
  end
end
