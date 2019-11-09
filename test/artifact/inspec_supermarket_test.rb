require_relative "artifact_helper"

class TestInspecSupermarket < ArtifactTest
  def test_supermarket
    assert_artifact("supermarket profiles")
  end
end
