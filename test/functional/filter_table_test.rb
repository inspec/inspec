require "functional/helper"

describe "filtertable functional tests" do
  include FunctionalHelper
  let(:run_opts) { { json: true, ignore_rspec_deprecations: true } }
  let(:ft_profile_path) { File.join(profile_path, "filter_table") }

  def run_result_for_controls(controls)
    cmd = "exec " + ft_profile_path + " --controls " + controls.join(" ")
    run_inspec_process(cmd, run_opts)
  end

  def failed_control_test_outcomes(run_result)
    failed_controls = @json["profiles"][0]["controls"].select { |ctl| ctl["results"][0]["status"] == "failed" }

    # Re-package any failed controls into a hash mapping control_id => message
    # We will later test against this, as it provides more informative test output
    control_hash = {}
    failed_controls.each do |ctl|
      control_hash[ctl["id"]] = ctl["results"][0]["message"]
    end
    control_hash
  end

  def skipped_control_test_outcomes(run_result)
    skipped_controls = @json["profiles"][0]["controls"].select { |ctl| ctl["results"][0]["status"] == "skipped" }

    # Re-package any skipped controls into a hash mapping control_id => message
    # We will later test against this, as it provides more informative test output
    control_hash = {}
    skipped_controls.each do |ctl|
      control_hash[ctl["id"]] = ctl["results"][0]["skip_message"]
    end
    control_hash
  end

  def expect_clean_run(controls)
    run_result = run_result_for_controls(controls)
    outcome_hash = failed_control_test_outcomes(run_result)
    _(outcome_hash).must_be_empty
    assert_exit_code 0, run_result
  end

  def expect_all_fail_run(controls)
    run_result = run_result_for_controls(controls)
    outcome_hash = failed_control_test_outcomes(run_result)

    controls.each do |expected_control|
      _(outcome_hash.keys).must_include(expected_control)
    end

    _(stderr_ignore_deprecations(run_result)).must_equal "" # TODO: we have a cli_option_json_config triggering somewhere
    assert_exit_code 100, run_result
  end

  describe "2943 inspec exec for filter table profile, method mode for `where" do
    it "positive tests should pass" do
      controls = %w{
        2943_pass_undeclared_field_in_hash
        2943_pass_irregular_row_key
        2943_pass_raise_error_when_key_not_in_data
        2943_pass_allow_symbols_as_criteria_when_data_is_string_keyed
        2943_pass_allow_strings_as_criteria_when_data_is_symbol_keyed
        2943_pass_no_error_when_no_data
      }
      expect_clean_run(controls)
    end

    it "negative tests should fail but not abort" do
      controls = [
        "2943_fail_derail_check",
      ]
      expect_all_fail_run(controls)
    end
  end

  describe "3103 default methods for filter table" do
    it "positive tests should pass" do
      controls = %w{
        3103_where_defined
        3103_entries_defined
        3103_raw_data_defined
        3103_exists_defined
        3103_count_defined
      }
      expect_clean_run(controls)
    end
  end

  describe "2370 lazy_load for filter table" do
    it "positive tests should pass" do
      controls = %w{
        2370_where_block
        2370_where_block_only_referenced
        2370_where_method
        2370_where_method_only_referenced
        2370_populate_once
        2370_no_side_populate
        2370_no_clobber
        2370_list_property
        2370_list_property_filter_method
        2370_list_property_filter_block
        2370_no_rows
      }
      expect_clean_run(controls)
    end

    it "negative tests should fail but not abort" do
      controls = [
        "2370_fail_proc_handle_exception",
      ]
      expect_all_fail_run(controls)
    end
  end

  describe "2929 exceptions in block-mode where" do
    include FunctionalHelper

    it "positive tests should pass" do
      controls = [
        "2929_exception_in_where",
      ]
      expect_clean_run(controls)
    end
  end

  describe "3110 do not expose block-valued properties in raw data" do
    include FunctionalHelper

    it "positive tests should pass" do
      controls = %w{
        3110_entries_defined
        3110_raw_data_defined
      }
      expect_clean_run(controls)
    end
  end

  describe "if control fails" do
    it "should show the exact error message" do
      skip_windows!
      controls = ["exception_catcher_test"]
      run_result = run_result_for_controls(controls)
      outcome_hash = skipped_control_test_outcomes(run_result)
      _(outcome_hash["exception_catcher_test"]).must_include "Can't find file: \/tmp\/no-file"
      assert_exit_code 101, run_result
    end
  end
end
