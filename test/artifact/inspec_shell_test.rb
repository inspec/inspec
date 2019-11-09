require_relative "artifact_helper"

class TestInspecShell < ArtifactTest
  def test_shell
    assert_artifact("shell -c 'os.family'")
  end
end
