require_relative "artifact_helper"

class TestInspecArchive < ArtifactTest
  def test_archive
    skip
    assert_artifact(:archive)
  end
end
