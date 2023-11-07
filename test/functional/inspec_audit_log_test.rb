require "functional/helper"

describe "inspec audit log feature" do
  parallelize_me!

  include FunctionalHelper

  before do
    FileUtils.rm_f Dir.glob("#{Inspec.log_dir}/*")
  end

  after do
    FileUtils.rm_f Dir.glob("#{Inspec.log_dir}/*")
  end

  describe "When audit logging off" do
    it "should not create create audit log file in the default location when inpsec exec run" do
      cli_args = "--audit-log-location #{Inspec.log_dir}/inspec-test-audit.log"
      run_result = run_inspec_process("exec " + File.join(profile_path, "basic_profile") + " " + cli_args)
      _(run_result.exit_status).must_equal 0
      _(Dir.glob("#{Inspec.log_dir}/*").count).must_equal 0
    end
  end

  describe "When audit logging on" do
    it "should create audit log file in the default location when inpsec exec run" do
      cli_args = "--audit-log-location #{Inspec.log_dir}/inspec-test-audit.log"
      run_result = run_inspec_process("exec " + File.join(profile_path, "basic_profile") + " " + cli_args, env: { CHEF_PREVIEW_AUDIT_LOGGING: "1" })
      _(run_result.exit_status).must_equal 0
      _(Dir.glob("#{Inspec.log_dir}/*").count).must_equal 1
      _(File.basename(Dir.glob("#{Inspec.log_dir}/*")[0])).must_match(/inspec-test-audit-\d{4}\d{2}\d{2}T\d{2}\d{2}\d{2}-\b\d+\b.log/)
    end

    it "should create inspec-audit.log file in the default location when inpsec exec run" do
      cli_args = " --audit-log-location #{Inspec.log_dir}/inspec-test-audit.log"
      run_result = run_inspec_process("shell " + " " + cli_args, env: { CHEF_PREVIEW_AUDIT_LOGGING: "1" })
      _(run_result.exit_status).must_equal 0
      _(Dir.glob("#{Inspec.log_dir}/*").count).must_equal 1
      _(File.basename(Dir.glob("#{Inspec.log_dir}/*")[0])).must_match(/inspec-test-audit-\d{4}\d{2}\d{2}T\d{2}\d{2}\d{2}-\b\d+\b.log/)
    end
  end
end