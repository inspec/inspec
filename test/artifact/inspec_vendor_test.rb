require_relative "artifact_helper"

class TestInspecVendor < ArtifactTest
  def test_vendor
    skip
    assert_artifact(:vendor)
  end
end
