require_relative "../../../shared/core_plugin_test_helper"
require "tempfile" unless defined?(Tempfile)

describe "inspec-reporter-html2" do
  include CorePluginFunctionalHelper

  let(:output_file) { f = Tempfile.new(["temp", ".html"]); f.close; f.path }
  def teardown
    # Use force because the deletion may occasionally fail in parallel CI
    FileUtils.rm_f(output_file)
  end

  describe "when run on a basic profile" do
    # --no-distinct-exit is needed because this profile skips a control on windows
    let(:run_result) { run_inspec_process("exec #{profile_path}/old-examples/profile --no-distinct-exit --reporter html2:#{output_file}") }

    it "it should not crash inspec" do
      _(run_result.stderr.gsub("#< CLIXML\r\n", "")).must_be_empty
      _(run_result.exit_status).must_equal 0
    end
  end

  describe "when run with alternate JS and CSS" do
    let(:run_result) { run_inspec_process("exec #{profile_path}/old-examples/profile --config lib/plugins/inspec-reporter-html2/test/fixtures/config.json --reporter html2:#{output_file}") }

    it "should include the alternate files" do
      run_result
      output = File.read(output_file)
      _(output).must_include "this is the alternate.js"
      _(output).must_include "this is the alternate.css"
    end
  end
end
