require "helper"
require "inspec/resource"
require "inspec/resources/selinux"

describe "Inspec::Resources::Selinux" do
  it "verify selinux state - enforcing" do
    resource = load_resource("selinux")
    _(resource.enforcing?).must_equal true
  end

  it "verify selinux state - permissive" do
    resource = load_resource("selinux")
    _(resource.permissive?).must_equal false
  end

  it "verify selinux disabled " do
    resource = load_resource("selinux")
    _(resource.disabled?).must_equal false
  end

  it "verify selinux on windows" do
    resource = MockLoader.new("windows").load_resource("selinux")
    _(resource.enforcing?).must_equal nil
  end
end
