require "functional/helper"

describe "inspec exec and inspec shell with audit logging on " do
  include FunctionalHelper

  after do
    delete_audit_log_file("#{Inspec.log_dir}/train-audit.log")
  end

  it "should create train-audit.log file in the default location when inpsec exec run" do
    run_result = run_inspec_process("exec " + File.join(profile_path, "basic_profile") + " ", env: { CHEF_PREVIEW_AUDIT_LOGGING: "1" })
    _(File.exist?("#{Inspec.log_dir}/train-audit.log")).must_equal true
    _(run_result.stdout).must_include "1 successful control"
    _(run_result.exit_status).must_equal 0
    _(File.exist?("#{Inspec.log_dir}/train-audit.log")).must_equal true
  end

  it "shoudl not create train-audit.log file if the audit log is disabled" do
    cli_args = " --disable-audit-log"
    run_result = run_inspec_process("exec " + File.join(profile_path, "basic_profile") + cli_args, env: { CHEF_PREVIEW_AUDIT_LOGGING: "1" })
    _(File.exist?"#{Inspec.log_dir}/train-audit.log").must_equal false
    _(run_result.stdout).must_include "1 successful control"
    _(run_result.exit_status).must_equal 0
  end

  it "shoudl not create train-audit.log file if preview feature flag is not set" do
    run_result = run_inspec_process("exec " + File.join(profile_path, "basic_profile"))
    _(File.exist?"#{Inspec.log_dir}/train-audit.log").must_equal false
    _(run_result.stdout).must_include "1 successful control"
    _(run_result.exit_status).must_equal 0
  end

  it "should create train-audit.log file in the default location" do
    run_result = run_inspec_process("shell " + " ", env: { CHEF_PREVIEW_AUDIT_LOGGING: "1" })
    _(File.exist?("#{Inspec.log_dir}/train-audit.log")).must_equal true
    _(run_result.exit_status).must_equal 0
  end

  def delete_audit_log_file(file_path)
    puts "***** #{file_path}"
    puts "****File #{file_path} exist? : #{File.exist?(file_path)}"
    File.delete(file_path) if File.exist?(file_path)
  end
end
