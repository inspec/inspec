require_relative "artifact_helper"
require "open3"

class TestInspecVersion < ArtifactTest
  def test_version
    assert_artifact(:version)
  end
end
