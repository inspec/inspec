require_relative "../../../shared/core_plugin_test_helper.rb"
require "tempfile"
require "html-proofer"

describe "inspec-reporter-html2" do
  include CorePluginFunctionalHelper

  let(:output_file) { f = Tempfile.new(["temp", ".html"]); f.close; f.path }
  def teardown
    FileUtils.rm(output_file)
  end

  describe "when run on a basic profile" do
    let(:run_result) { run_inspec_process("exec #{profile_path}/old-examples/profile --reporter html2:#{output_file}") }

    it "it should not crash inspec" do
      _(run_result.stderr).must_be_empty
      _(run_result.exit_status).must_equal 0
    end

    it "should produce valid HTML" do
      proofer_opts = {
        disable_external: true, # The old-example has 3 Ref links that are all 404s
        check_html: true,
        # Default of :info produces progress logs to stdout. At :warn it is silent
        # but will fail the test below if there is validation failure.
        log_level: :warn,
      }
      run_result

      _(proc { HTMLProofer.check_file(output_file, proofer_opts).run } ).must_be_silent
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
