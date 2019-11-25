require_relative "artifact_helper"

class TestInspecCheck < ArtifactTest
  def test_check
    assert_artifact("check examples/profile")
  end
end
