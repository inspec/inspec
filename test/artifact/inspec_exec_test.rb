require_relative "artifact_helper"

class TestInspecExec < ArtifactTest
  def test_exec
    assert_artifact("exec examples/meta-profile")
  end
end
