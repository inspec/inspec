require_relative "artifact_helper"

class TestInspecHabitat < ArtifactTest
  def test_habitat
    assert_artifact("habitat profile help create")
  end
end
