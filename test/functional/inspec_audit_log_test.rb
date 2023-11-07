require "functional/helper"

describe "inspec exec and inspec shell with audit logging on " do
  parallelize_me!

  include FunctionalHelper

  before do
    delete_audit_log_file("#{Inspec.log_dir}/inspec-audit.log")
  end

  it "should create inspec-audit.log file in the default location when inpsec exec run" do
    run_result = run_inspec_process("exec " + File.join(profile_path, "basic_profile") + " ", env: { CHEF_PREVIEW_AUDIT_LOGGING: "1" })
    _(run_result.stdout).must_include "1 successful control"
    _(run_result.exit_status).must_equal 0
    _(File.exist?("#{Inspec.log_dir}/inspec-audit.log")).must_equal true
    delete_audit_log_file("#{Inspec.log_dir}/inspec-audit.log")
  end

  it "shoudl not create inspec-audit.log file if preview feature flag is not set" do
    run_result = run_inspec_process("exec " + File.join(profile_path, "basic_profile"))
    _(run_result.stdout).must_include "1 successful control"
    _(run_result.exit_status).must_equal 0
    _(File.exist?"#{Inspec.log_dir}/inspec-audit.log").must_equal false
  end

  it "should create inspec-audit.log file in the default location" do
    run_result = run_inspec_process("shell " + " ", env: { CHEF_PREVIEW_AUDIT_LOGGING: "1" })
    _(run_result.exit_status).must_equal 0
    _(File.exist?("#{Inspec.log_dir}/inspec-audit.log")).must_equal true
    delete_audit_log_file("#{Inspec.log_dir}/inspec-audit.log")
  end

  it "should create inspec-audit.log file in the default location" do
    run_result = run_inspec_process("shell " + " ")
    _(run_result.exit_status).must_equal 0
    _(File.exist?("#{Inspec.log_dir}/inspec-audit.log")).must_equal false
  end

  def delete_audit_log_file(file_path)
    File.delete(file_path) if File.exist?(file_path)
  end
end