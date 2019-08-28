require "functional/helper"

describe "waivers" do
  include FunctionalHelper
  let(:waivers_profiles_path) { "#{profile_path}/waivers" }

  def assert_test_outcome(expected, result_json)
    assert_equal expected, result_json["status"]
  end

  def assert_waiver_annotation(result_json)
    # TODO - test JSON for waiver annotation
  end

  def refute_waiver_annotation(result_json)
    # TODO - test JSON for waiver annotation
    # Don't suppose we get this for free by defining assert_waiver_annotation ...
  end

  describe "a fully pre-slugged control file" do
    it "has all of the expected outcomes" do
      cmd = "exec #{waivers_profiles_path}/basic --input-file #{waivers_profiles_path}/basic/files/waivers.yaml"
      run_result = run_inspec_process(cmd,json: true)
      controls_by_id = run_result.payload.json["profiles"][0]["controls"].map {|c| [c["id"], c] }.to_h

      [
        "01_not_waivered_passes",
        "03_waivered_no_expiry_not_skipped_passes", # this had a waiver but still passed - no annotation?
        "06_waivered_expiry_in_past_not_skipped_passes", # a stale waiver
        "08_waivered_expiry_in_past_skipped", # another stale waiver
        "09_waivered_expiry_in_future_not_skipped_passes", # unneeded waiver
      ].each do |control_id|
        result = controls_by_id[control_id]["results"][0]
        assert_test_outcome "passed", result
        refute_waiver_annotation result
      end

      [
        "02_not_waivered_fails",
        "07_waivered_expiry_in_past_not_skipped_fails", # Should this give a special waiver expired message?
      ].each do |control_id|
        result = controls_by_id[control_id]["results"][0]
        assert_test_outcome "failed", result
        refute_waiver_annotation result
      end

      # Each of these should have been forced to skip by the waiver system
      [
        "05_waivered_no_expiry_skipped",
        "11_waivered_expiry_in_future_skipped"
      ].each do |control_id|
        result = controls_by_id[control_id]["results"][0]
        assert_test_outcome "skipped", result
        assert_waiver_annotation result
      end

      # Each of these should have had a failure, but had a waiver annotation
      # added to the output.
      [
        "04_waivered_no_expiry_not_skipped_fails",
        "10_waivered_expiry_in_future_not_skipped_fails"
      ].each do |control_id|
        result = controls_by_id[control_id]["results"][0]
        assert_test_outcome "failed", result
        assert_waiver_annotation result
      end

    end
  end

  # describe "an inherited profile"
  # describe "a profile whose control ids require transformation"
end
