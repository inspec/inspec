require "minitest/autorun"

class TestArtifactDetect < Minitest::Test
  def test_inspec_exists_linux
    skip if windows?
    refute_match(/no inspec/, `/usr/bin/which inspec`)
  end

  def test_inspec_exists_windows
    skip unless windows?
    assert_match(/inspec.bat/, `Get-Command inspec`)
  end

  def test_detect
    exit = nil
    out, err = capture_subprocess_io do
      exit = system("inspec detect --no-color")
    end

    assert_empty err.sub(/#< CLIXML\n/, "")
    assert_match(/Platform Details/, out)
    assert exit
  end
end
