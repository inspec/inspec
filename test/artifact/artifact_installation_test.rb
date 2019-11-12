require_relative "artifact_helper"

class TestArtifactInstallation < Minitest::Test
  parallelize_me!

  def test_inspec_exists
    if windows?
      stdout, stderr, status = Open3.capture3("Get-Command inspec")
      assert_match(/inspec.bat/, stdout)
    else
      stdout, stderr, status = Open3.capture3({ "PATH" => ENV["PATH"] },
                                              "/usr/bin/which inspec")
      refute_match(/no inspec/, stdout)
      assert_includes(ENV["PATH"], "/bin")
    end

    assert_empty stderr
    assert status
  end
end
