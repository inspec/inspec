require_relative "artifact_helper"

class TestInspecHelp < ArtifactTest
  def test_help
    assert_artifact(:help)
  end
end
