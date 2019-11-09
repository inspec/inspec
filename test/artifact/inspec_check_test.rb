require_relative "artifact_helper"

class TestInspecCheck < ArtifactTest
  def test_check
    skip
    assert_artifact(:check)
  end
end
