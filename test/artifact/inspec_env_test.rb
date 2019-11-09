require_relative "artifact_helper"

class TestInspecEnv < ArtifactTest
  def test_env
    assert_artifact(:env)
  end
end
