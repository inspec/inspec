require "helper"
require "inspec/profile_context"
require "inspec/runner_mock"

describe "resource exception" do
  let(:profile) do
    profile = MockLoader.load_profile("profile-with-resource-exceptions")
    profile.load_libraries
    profile.collect_tests
    profile
  end

  let(:checks) do
    checks = []
    profile.runner_context.rules.values.each do |rule|
      checks.push(Inspec::Rule.prepare_checks(rule))
    end
    checks
  end

  describe "within initialize" do
    it "skips resource when `Inspec::Exceptions::ResourceSkipped` is raised" do
      _(checks[0][0][1][0].resource_skipped?).must_equal true
      _(checks[0][0][1][0].resource_exception_message).must_equal "Skipping because reasons"
      _(checks[0][0][1][0].resource_failed?).must_equal false
    end

    it "fails resource when `Inspec::Exceptions::ResourceFailed` is raised" do
      _(checks[1][0][1][0].resource_failed?).must_equal true
      _(checks[1][0][1][0].resource_exception_message).must_equal "Failing because reasons"
      _(checks[1][0][1][0].resource_skipped?).must_equal false
    end

    it "does not affect other tests" do
      _(checks[2][0][1][0].resource_skipped?).must_equal false
      _(checks[2][0][1][0].resource_failed?).must_equal false
      _(checks[2][0][1][0].resource_exception_message).must_be_nil
    end
  end

  describe "within a matcher" do
    it "fails resource when `Inspec::Exceptions::ResourceFailed` is raised" do
      _(checks[3][0][1][0].resource_failed?).must_equal true
      _(checks[3][0][1][0].resource_exception_message).must_equal "Failing inside matcher"
      _(checks[3][0][1][0].resource_skipped?).must_equal false
    end

    it "skips resource when `Inspec::Exceptions::ResourceSkipped` is raised" do
      _(checks[4][0][1][0].resource_skipped?).must_equal true
      _(checks[4][0][1][0].resource_exception_message).must_equal "Skipping inside matcher"
      _(checks[4][0][1][0].resource_failed?).must_equal false
    end
  end

  describe "within a control" do
    it "skips resource when `Inspec::Exceptions::ResourceSkipped` is raised" do
      _(checks[5][0][1][0].resource_skipped?).must_equal true
      _(checks[5][0][1][0].resource_exception_message).must_equal "Skipping because reasons"
      _(checks[5][0][1][0].resource_failed?).must_equal false
    end

    it "fails resource when `Inspec::Exceptions::ResourceFailed` is raised" do
      _(checks[5][1][1][0].resource_failed?).must_equal true
      _(checks[5][1][1][0].resource_exception_message).must_equal "Failing because reasons"
      _(checks[5][1][1][0].resource_skipped?).must_equal false
    end
  end

  describe "within FilterTable" do
    it "skips resource when `Inspec::Exceptions::ResourceSkipped` is raised" do
      _(checks[6][0][1][0].resource_skipped?).must_equal true
      _(checks[6][0][1][0].resource_exception_message).must_equal "Skipping inside FilterTable"
      _(checks[6][0][1][0].resource_failed?).must_equal false
    end

    it "fails resource when `Inspec::Exceptions::ResourceFailed` is raised" do
      _(checks[7][0][1][0].resource_failed?).must_equal true
      _(checks[7][0][1][0].resource_exception_message).must_equal "Failing inside FilterTable"
      _(checks[7][0][1][0].resource_skipped?).must_equal false
    end

    describe "and multiple filters are used" do
      it "skips resource when `Inspec::Exceptions::ResourceSkipped` is raised" do
        _(checks[8][0][1][0].resource_skipped?).must_equal true
        _(checks[8][0][1][0].resource_exception_message).must_equal "Skipping inside FilterTable"
        _(checks[8][0][1][0].resource_failed?).must_equal false
      end

      it "fails resource when `Inspec::Exceptions::ResourceFailed` is raised" do
        _(checks[9][0][1][0].resource_failed?).must_equal true
        _(checks[9][0][1][0].resource_exception_message).must_equal "Failing inside FilterTable"
        _(checks[9][0][1][0].resource_skipped?).must_equal false
      end

      it "does not halt the run/fail all tests when an incorrect filter is used" do
        _(checks[10][0][1][0].resource_skipped?).must_equal true
        _(checks[10][0][1][0].resource_exception_message).must_equal "Skipping inside FilterTable"
        _(checks[10][0][1][0].resource_failed?).must_equal false
      end

      it "does not halt the run/fail all tests when an incorrect filter is used" do
        _(checks[11][0][1][0].resource_failed?).must_equal true
        _(checks[11][0][1][0].resource_exception_message).must_equal "Failing inside FilterTable"
        _(checks[11][0][1][0].resource_skipped?).must_equal false
      end
    end

    it "does not affect regular FilterTable usage" do
      _(checks[12][0][1][0].another_filter).must_equal ["example"]
    end
  end
end
