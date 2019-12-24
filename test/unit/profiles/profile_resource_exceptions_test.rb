require "helper"
require "inspec/profile_context"
require "inspec/runner_mock"

describe "resource exception" do
  let(:profile) do
    profile = MockLoader.load_profile("profile-with-resource-exceptions")
    profile.load_libraries
    profile.collect_tests # TODO: bad name?
    profile
  end

  let(:checks) do
    profile.runner_context.rules.map do |_, rule|
      Inspec::Rule.prepare_checks(rule)
    end
  end

  def assert_check(nth, skipped, failed, msg = nil)
    nth = [nth, 0, 1, 0] unless Array === nth
    result = checks.dig(*nth)

    if msg
      _(result.resource_exception_message).must_equal msg
    else
      _(result.resource_exception_message).must_be_nil
    end
    _(result.resource_failed?).must_equal failed
    _(result.resource_skipped?).must_equal skipped
  end

  def assert_skipped(nth, msg) # skips resource when `Inspec::Exceptions::ResourceSkipped` is raised
    assert_check nth, true, false, msg
  end

  def assert_failed(nth, msg) # fails resource when `Inspec::Exceptions::ResourceFailed` is raised
    assert_check nth, false, true, msg
  end

  it "within initialize" do
    assert_skipped  0, "Skipping because reasons"
    assert_failed   1, "Failing because reasons"
    assert_check    2, false, false # does not affect other tests
  end

  it "within a matcher" do
    assert_failed   3, "Failing inside matcher"
    assert_skipped  4, "Skipping inside matcher"
  end

  it "within a control" do
    idx = [5, 1, 1, 0]
    assert_skipped  5, "Skipping because reasons"
    assert_failed idx, "Failing because reasons"
  end

  it "within FilterTable" do
    assert_skipped  6, "Skipping inside FilterTable"
    assert_failed   7, "Failing inside FilterTable"
  end

  it "within FilterTable when multiple filters are used" do
    assert_skipped  8, "Skipping inside FilterTable"
    assert_failed   9, "Failing inside FilterTable"
    # does not halt the run/fail all tests when an incorrect filter is used:
    assert_skipped 10, "Skipping inside FilterTable"
    assert_failed  11, "Failing inside FilterTable"
  end

  it "within FilterTable does not affect regular FilterTable usage" do
    _(checks.dig(12, 0, 1, 0).another_filter).must_equal ["example"]
  end
end
