require_relative "artifact_helper"

class TestInspecPlugin < ArtifactTest
  def test_plugin_lsit
    assert_artifact("plugin list")
  end
end
