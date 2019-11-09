require_relative "artifact_helper"

class TestInspecDetect < ArtifactTest
  def test_detect
    assert_artifact("detect --no-color")
  end
end
