require_relative "artifact_helper"

class TestInspecInit < ArtifactTest
  def test_init_profile
    assert_artifact("init profile inspec-profile")
  end

  def test_init_plugin
    assert_artifact("init plugin inspec-plugin --no-prompt")
  end
end
