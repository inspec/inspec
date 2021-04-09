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

  it "verify selinux on linux" do
    resource = MockLoader.new(:linux).load_resource("selinux")
    _(resource.enforcing?).must_equal true
    _(resource.permissive?).must_equal false
    _(resource.disabled?).must_equal false
  end

  it "verify selinux on windows" do
    resource = MockLoader.new(:windows).load_resource("selinux")
    _(resource.enforcing?).must_be_nil
  end

  it "verify selinux on freebsd" do
    resource = MockLoader.new(:freebsd12).load_resource("selinux")
    _(resource.enforcing?).must_be_nil
  end
end
