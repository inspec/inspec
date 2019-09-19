require "minitest/autorun"

class TestArtifactDetect < Minitest::Test
  def test_detect
    out, err = capture_subprocess_io {
      assert system("inspec detect --no-color")
    }

    assert_match %r%Platform Details%, out
    assert_empty err
  end
end
