require_relative "artifact_helper"

class TestInspecJson < ArtifactTest
  def test_json
    assert_artifact("json examples/profile")
  end
end
