require "functional/helper"

describe "inspec audit log feature" do
  parallelize_me!

  include FunctionalHelper

  describe "when audit log is off" do
    let(:audit_log_file) { "#{Inspec.log_dir}/inspec-audit.log" }

    before do
      delete_audit_log_file(audit_log_file.to_s)
    end

    it "should not create inspec-audit.log file in the default location when inpsec exec run" do
      cli_args = " --audit-log-location #{audit_log_file}"
      run_result = run_inspec_process("exec " + File.join(profile_path, "basic_profile") + " " + cli_args)
      _(run_result.exit_status).must_equal 0
      _(File.exist?(audit_log_file)).must_equal false
    end
  end

  describe "When audit logging on" do
    let(:audit_log_file) { "#{Inspec.log_dir}/inspec-audit.log" }

    before do
      delete_audit_log_file(audit_log_file.to_s)
    end

    it "should create inspec-audit.log file in the default location when inpsec exec run" do
      cli_args = " --audit-log-location #{audit_log_file}"
      run_result = run_inspec_process("exec " + File.join(profile_path, "basic_profile") + " " + cli_args, env: { CHEF_PREVIEW_AUDIT_LOGGING: "1" })
      _(run_result.stdout).must_include "1 successful control"
      _(run_result.exit_status).must_equal 0
      _(File.exist?(audit_log_file)).must_equal true
      delete_audit_log_file("#{Inspec.log_dir}/inspec-audit.log")
    end

    it "should create inspec-audit.log file in the default location" do
      cli_args = " --audit-log-location #{Inspec.log_dir}/inspec-audit.log"
      run_result = run_inspec_process("shell " + " " + cli_args, env: { CHEF_PREVIEW_AUDIT_LOGGING: "1" })
      _(run_result.exit_status).must_equal 0
      _(File.exist?("#{Inspec.log_dir}/inspec-audit.log")).must_equal true
      delete_audit_log_file("#{Inspec.log_dir}/inspec-audit.log")
    end
  end

  def delete_audit_log_file(file_path)
    File.delete(file_path) if File.exist?(file_path)
  end
end