require_relative "artifact_helper"

class TestInspecArchive < ArtifactTest
  def test_archive
    assert_artifact("archive examples/profile")
  end
end
