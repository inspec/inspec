require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/linux_audit_system"

describe Inspec::Resources::LinuxAuditSystem do

  # Linux OS
  it "checks linux audit configuration on Ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("linux_audit_system")
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.rules).must_include "-w /etc -p wa"
    _(resource.rules).must_include "-a always,exit -S open -F success=0"
    _(resource.rules).wont_include "-a always,exit -S close -F failure=0"
  end

  # Unsupported OS: Darwin
  it "fails to check linux audit configuration on Darwin" do
    resource = MockLoader.new(:macos10_10).load_resource("linux_audit_system")
    _(resource.resource_skipped?).must_equal true
    _(resource.resource_exception_message).must_equal "Could not find `auditctl`. This resource requires `auditctl` utility to be available on the system."
  end

  # Unsupported OS: Windows
  it "fails to check linux audit configuration on Windows" do
    resource = MockLoader.new(:windows).load_resource("linux_audit_system")
    _(resource.resource_skipped?).must_equal true
    _(resource.resource_exception_message).must_equal "Could not find `auditctl`. This resource requires `auditctl` utility to be available on the system."
  end
end
