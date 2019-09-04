require "functional/helper"

describe "waivers" do
  include FunctionalHelper
  let(:waivers_profiles_path) { "#{profile_path}/waivers" }
  let(:run_result) { run_inspec_process(cmd, json: true) }
  let(:controls_by_id) { run_result.payload.json.dig("profiles", 0, "controls").map { |c| [c["id"], c] }.to_h }
  let(:cmd) { "exec #{waivers_profiles_path}/#{profile_name} --input-file #{waivers_profiles_path}/#{profile_name}/files/#{waiver_file}" }

  def assert_test_outcome(expected, control_id)
    assert_equal expected, controls_by_id.dig(control_id, "results", 0, "status")
  end

  def assert_waiver_annotation(control_id)
    # TODO - test JSON for waiver annotation
  end

  def refute_waiver_annotation(control_id)
    # TODO - test JSON for waiver annotation
    # Don't suppose we get this for free by defining assert_waiver_annotation ...
  end

  describe "a fully pre-slugged control file" do
    let(:profile_name) { "basic" }
    let(:waiver_file) { "waivers.yaml" }

    it "has all of the expected outcomes" do
      [
        "01_not_waivered_passes",
        "03_waivered_no_expiry_not_skipped_passes", # this had a waiver but still passed - no annotation?
        "06_waivered_expiry_in_past_not_skipped_passes", # a stale waiver
        "08_waivered_expiry_in_past_skipped", # another stale waiver
        "09_waivered_expiry_in_future_not_skipped_passes", # unneeded waiver
      ].each do |control_id|
        assert_test_outcome "passed", control_id
        refute_waiver_annotation control_id
      end

      [
        "02_not_waivered_fails",
        "07_waivered_expiry_in_past_not_skipped_fails", # Should this give a special waiver expired message?
      ].each do |control_id|
        assert_test_outcome "failed", control_id
        refute_waiver_annotation control_id
      end

      # Each of these should have been forced to skip by the waiver system
      %w{
        05_waivered_no_expiry_skipped
        11_waivered_expiry_in_future_skipped
      }.each do |control_id|
        assert_test_outcome "skipped", control_id
        assert_waiver_annotation control_id
      end

      # Each of these should have had a failure, but had a waiver annotation
      # added to the output.
      %w{
        04_waivered_no_expiry_not_skipped_fails
        10_waivered_expiry_in_future_not_skipped_fails
      }.each do |control_id|
        assert_test_outcome "failed", control_id
        assert_waiver_annotation control_id
      end
    end
  end

  # describe "an inherited profile"
  # describe "a profile whose control ids require transformation"

  describe "a waiver file with invalid dates" do
    let(:profile_name) { "short" }
    let(:waiver_file) { "bad-date.yaml" }
    it "gracefully errors" do
      result = run_result
      assert_includes "ERROR", result.stdout # the error level
      assert_includes "01_small", result.stdout # the offending control ID
      assert_includes "never", result.stdout  # The bad value
      assert_equal 1, result.exit_status
    end
  end
end
