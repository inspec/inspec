require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/linux_audit_system"

describe Inspec::Resources::LinuxAuditSystem do

  it "works correctly with the constructor on the platform" do
    resource = MockLoader.new(:ubuntu).load_resource("linux_audit_system")
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    # _(resource.rules).must_include "some value"
  end
end
