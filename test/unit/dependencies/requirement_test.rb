require "helper"
require "inspec/dependencies/requirement"

describe Inspec::Requirement do
  let(:config) { { cwd: nil, backend: nil } }
  let(:req) { Inspec::Requirement.new("foo", constraints, config, {}) }

  describe "#source_satisfies_spec?" do

    describe "when there are no version constraints" do
      let(:constraints) { nil }
      it "returns true" do
        req.source_satisfies_spec?.must_equal true
      end
    end

    describe "when there is a single, matching version constraint" do
      let(:constraints) { ">= 1" }
      it "returns true" do
        profile = mock
        profile.stubs(:version).returns("2.0.0")
        req.stubs(:profile).returns(profile)
        req.source_satisfies_spec?.must_equal true
      end
    end

    describe "when there is a single, non-matching version constraint" do
      let(:constraints) { ">= 2" }
      it "returns true" do
        profile = mock
        profile.stubs(:version).returns("1.0.0")
        req.stubs(:profile).returns(profile)
        req.source_satisfies_spec?.must_equal false
      end
    end

    describe "when there are multiple matching version constraints" do
      let(:constraints) { [">= 1", "< 3"] }
      it "returns true" do
        profile = mock
        profile.stubs(:version).returns("2.0.0")
        req.stubs(:profile).returns(profile)
        req.source_satisfies_spec?.must_equal true
      end
    end

    describe "when there are multiple version constraints and one does not match" do
      let(:constraints) { [">= 1", "< 3"] }
      it "returns true" do
        profile = mock
        profile.stubs(:version).returns("4.0.0")
        req.stubs(:profile).returns(profile)
        req.source_satisfies_spec?.must_equal false
      end
    end

    describe "when a profile has a version with a build number and the constraint matches" do
      let(:constraints) { ">= 1" }
      it "returns true" do
        profile = mock
        profile.stubs(:version).returns("2.0.0+1")
        req.stubs(:profile).returns(profile)
        req.source_satisfies_spec?.must_equal true
      end
    end

    describe "when the constraint is the default >=0 and the profile has a pre-release number" do
      let(:constraints) { ">= 0" }
      it "returns true" do
        profile = mock
        profile.stubs(:version).returns("2.0.0-1")
        req.stubs(:profile).returns(profile)
        req.source_satisfies_spec?.must_equal true
      end
    end
  end

  describe "#to_hash" do
    let(:constraints) { nil }
    it "returns the correct Hash" do
      resolved_source = { compliance: "spam", url: "eggs", sha256: "bacon" }
      req.stubs(:resolved_source).returns(resolved_source)
      req.stubs(:dependencies).returns({})

      correct_hash = {
        "name" => "foo",
        "resolved_source" => resolved_source,
        "version_constraints" => [],
      }

      req.to_hash.must_equal correct_hash
    end
  end
end
