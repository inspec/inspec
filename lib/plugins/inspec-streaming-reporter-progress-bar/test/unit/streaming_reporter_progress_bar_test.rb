require_relative "../../../shared/core_plugin_test_helper"
require_relative "../../lib/inspec-streaming-reporter-progress-bar"
require_relative "../../lib/inspec-streaming-reporter-progress-bar/streaming_reporter"

describe InspecPlugins::StreamingReporterProgressBar::StreamingReporter do
  let(:control_id) { "test-01" }
  let(:fixture_io) { StringIO.new(control_id) }
  let(:progress_bar_reporter) { InspecPlugins::StreamingReporterProgressBar::StreamingReporter.new(fixture_io) }
  let(:output) { fixture_io.string }
  let(:indicator) { InspecPlugins::StreamingReporterProgressBar::StreamingReporter::INDICATORS }
  let(:colors) { InspecPlugins::StreamingReporterProgressBar::StreamingReporter::COLORS }

  describe "#format_with_color" do
    %i{failed passed skipped error not_applicable not_reviewed}.each do |status|
      it("uses the color code for " + status.to_s) do
        result = progress_bar_reporter.send(:format_with_color, status.to_s, output)
        _(result).must_equal(colors[status.to_s] + "test-01" + colors["reset"])
      end
    end
  end

  describe "#set_status_mapping" do
    it "should set the status mapping" do
      progress_bar_reporter.send(:set_status_mapping, control_id, "passed")
      _(progress_bar_reporter.instance_variable_get(:@status_mapping)).must_equal({ "test-01" => ["passed"] })
    end
  end

  describe "#format_it" do
    it "should fprmat the output for passed scans" do
      progress_bar_reporter.send(:set_status_mapping, control_id, "passed")
      result = progress_bar_reporter.send(:format_it, control_id, "test-title", "test-full-description")
      _(result).must_equal("#{colors["passed"]}#{indicator["passed"]}  test-01  test-title  #{colors["reset"]}")
    end

    it "should format the output for failed scans" do
      progress_bar_reporter.send(:set_status_mapping, control_id, "failed")
      result = progress_bar_reporter.send(:format_it, control_id, "test-title", "test-full-description")
      _(result).must_equal("#{colors["failed"]}#{indicator["failed"]}  test-01  test-title  #{colors["reset"]}")
    end

    it "should format the output for skipped scans" do
      progress_bar_reporter.send(:set_status_mapping, control_id, "skipped")
      result = progress_bar_reporter.send(:format_it, control_id, "test-title", "test-full-description")
      _(result).must_equal("#{colors["skipped"]}#{indicator["skipped"]}  test-01  test-title  #{colors["reset"]}")
    end

    it "should format the output for error scans" do
      progress_bar_reporter.send(:set_status_mapping, control_id, "error")
      progress_bar_reporter.stubs(:control_outcome).returns("error")
      result = progress_bar_reporter.send(:format_it, control_id, "test-title", "test-full-description")
      _(result).must_equal("#{colors["error"]}#{indicator["error"]}  test-01  test-title  #{colors["reset"]}")
    end

    it "should format the output for not applicable scans" do
      progress_bar_reporter.send(:set_status_mapping, control_id, "not_applicable")
      progress_bar_reporter.stubs(:control_outcome).returns("not_applicable")
      result = progress_bar_reporter.send(:format_it, control_id, "test-title", "test-full-description")
      _(result).must_equal("#{colors["not_applicable"]}#{indicator["not_applicable"]}  test-01  test-title  #{colors["reset"]}")
    end

    it "should format the output for not reviewed scans" do
      progress_bar_reporter.send(:set_status_mapping, control_id, "not_reviewed")
      progress_bar_reporter.stubs(:control_outcome).returns("not_reviewed")
      result = progress_bar_reporter.send(:format_it, control_id, "test-title", "test-full-description")
      _(result).must_equal("#{colors["not_reviewed"]}#{indicator["not_reviewed"]}  test-01  test-title  #{colors["reset"]}")
    end
  end
end
