require "helper"
require "inspec/resource"
require "inspec/resources/audit_policy"

describe "Inspec::Resources::AuditPolicy" do
  it "check audit policy parsing" do
    resource = MockLoader.new(:windows).load_resource("audit_policy")
    _(resource.resource_id).must_equal "audit_policy"
    _(resource.send("User Account Management")).must_equal "Success"
  end

  it "check audit policy parsing" do
    resource = MockLoader.new(:windows).load_resource("audit_policy")
    _(resource.resource_id).must_equal "audit_policy"
    ex = assert_raises(Inspec::Exceptions::ResourceFailed) { resource.send("Some Invalid Key") }
    _(ex.message).must_include("Error while executing Auditpol /get /subcategory:'Some Invalid Key'")
  end
end
