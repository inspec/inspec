require_relative "artifact_helper"

class TestInspecJson < ArtifactTest
  def test_json
    skip
    # Need a tempdir
    assert_artifact(:json)
  end
end
