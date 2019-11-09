require_relative "artifact_helper"

class TestInspecCompliance < ArtifactTest
  def test_compliance_version
    assert_artifact("compliance help")
  end
end
