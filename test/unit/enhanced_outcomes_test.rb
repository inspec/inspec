require "helper"
require "inspec/enhanced_outcomes"

describe "Inspec::EnhancedOutcomes" do

  # ========================================================================== #
  #                   Determine enhanced outcomes status
  # ========================================================================== #
  describe "Determine enhanced outcomes based on control results" do
    describe "When results have exception" do
      let(:results) {
        [
          {
            status: "failed",
            code_desc: "a.1 ",
            run_time: 0.015382,
            start_time: "2024-01-10T15:54:21+05:30",
            resource_title: "a.1",
            expectation_message: "",
            waiver_data: nil,
            resource_class: "Object",
            resource_params: [],
            message: "undefined method `should_bot'\nDid you mean?  should_not",
            exception: "NoMethodError",
            backtrace: ["Some/test/backtrace/on/some/line"],
          },
        ]
      }
      it "returns status as error" do
        status = Inspec::EnhancedOutcomes.determine_status(results, nil)
        _(status).must_equal "error"
      end
    end

    describe "When results have no exception but control impact is zero" do
      let(:results) {
        [
          {
            status: "passed",
            code_desc: "e.1 is expected to cmp == \"e.1\"",
            run_time: 0.000129,
            start_time: "2024-01-10T16:04:54+05:30",
            resource_title: "e.1",
            expectation_message: "is expected to cmp == \"e.1\"",
            waiver_data: nil,
            resource_class: "Object",
            resource_params: [],
          },
        ]
      }
      it "returns status as not_applicable" do
        status = Inspec::EnhancedOutcomes.determine_status(results, 0.0)
        _(status).must_equal "not_applicable"
      end
    end

    describe "When results is not in NA or error status and have all tests skipped" do
      let(:results) {
        [
          {
            status: "skipped",
            code_desc: "No-op",
            run_time: 8.0e-06,
            start_time: "2024-01-10T16:04:54+05:30",
            resource_title: "<#<Class:0x00007f87f070b5a0>:0x00007f87f07087b0 @resource_skipped=true, @resource_failed=false, @supports=nil, @resource_exception_message=\"Skipped control due to only_if condition.\", @__backend_runner__=Inspec::Backend::Class @transport=Train::Transports::Local::Connection, @__resource_name__=:noop, @resource_params=[]>",
            expectation_message: "Skipped control due to only_if condition.",
            waiver_data: nil,
            resource_class: "noop",
            resource_params: [],
            skip_message: "Skipped control due to only_if condition.",
            resource: "No-op",
          },
        ]
      }
      it "returns status as not_reviewed" do
        status = Inspec::EnhancedOutcomes.determine_status(results, nil)
        _(status).must_equal "not_reviewed"
      end
    end

    describe "When results status are none of the above but have a failed test" do
      let(:results) {
        [
          {
            status: "failed",
            code_desc: "d.1 is expected not to cmp == \"d.1\"",
            run_time: 0.01356,
            start_time: "2024-01-10T16:04:54+05:30",
            resource_title: "d.1",
            expectation_message: "is expected not to cmp == \"d.1\"",
            waiver_data: nil,
            resource_class: "Object",
            resource_params: [],
            message: "\nexpected: d.1\n   got: d.1\n\n(compared using `cmp` matcher)\n" }, { status: "passed",
            code_desc: "d.1 is expected to cmp == \"d.1\"",
            run_time: 0.000298,
            start_time: "2024-01-10T16:04:54+05:30",
            resource_title: "d.1",
            expectation_message: "is expected to cmp == \"d.1\"",
            waiver_data: nil,
            resource_class: "Object",
            resource_params: [],
          }
        ]
      }
      it "returns status as failed" do
        status = Inspec::EnhancedOutcomes.determine_status(results, nil)
        _(status).must_equal "failed"
      end
    end

    describe "When results status are none of the above" do
      let(:results) {
        [
          {
            status: "passed",
            code_desc: "b.1 is expected to cmp == \"b.1\"",
            run_time: 0.000231,
            start_time: "2024-01-10T16:04:54+05:30",
            resource_title: "b.1",
            expectation_message: "is expected to cmp == \"b.1\"",
            waiver_data: nil,
            resource_class: "Object",
            resource_params: [],
          },
        ]
      }
      it "returns status as passed" do
        status = Inspec::EnhancedOutcomes.determine_status(results, nil)
        _(status).must_equal "passed"
      end
    end
  end
end