require_relative "artifact_helper"

class TestInspecHabitat < ArtifactTest
  def test_habitat
    assert_artifact("habitat profile create examples/profile")
  end
end
