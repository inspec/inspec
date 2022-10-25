require "helper"
require "inspec/resource"
require "inspec/resources/kernel_module"

describe "Inspec::Resources::KernelModule" do

  # kernel version
  # 1
  it "Verify kernel_module version" do
    resource = load_resource("kernel_module", "dhcp")
    _(resource.version).must_equal "3.2.2"
    _(resource.resource_id).must_equal "dhcp"
  end

  # loaded
  # 2
  it "Verify kernel_module parsing `loaded` - true" do
    resource = load_resource("kernel_module", "bridge")
    _(resource.loaded?).must_equal true
    _(resource.resource_id).must_equal "bridge"
  end

  # 3
  it "Verify kernel_module parsing `loaded` - false" do
    resource = load_resource("kernel_module", "bridges")
    _(resource.loaded?).must_equal false
    _(resource.resource_id).must_equal "bridges"
  end

  # disabled
  # 4
  it "Verify kernel_module parsing `disabled` - true " do
    resource = load_resource("kernel_module", "nvidiafb")
    _(resource.disabled?).must_equal true
    _(resource.resource_id).must_equal "nvidiafb"
  end

  # 5
  it "Verify kernel_module parsing `disabled` - false" do
    resource = load_resource("kernel_module", "bridge")
    _(resource.disabled?).must_equal false
    _(resource.resource_id).must_equal "bridge"
  end

  # /bin/true
  # 6
  it "Verify a kernel_module is disabled via /bin/true - true" do
    resource = load_resource("kernel_module", "nvidiafb")
    _(resource.blacklisted?).must_equal true
    _(resource.resource_id).must_equal "nvidiafb"
  end

  # 7
  it "Verify a kernel_module is not disabled via /bin/true - false" do
    resource = load_resource("kernel_module", "ssftb")
    _(resource.blacklisted?).must_equal false
    _(resource.resource_id).must_equal "ssftb"
  end

  # 8
  # /bin/false
  it "Verify a kernel_module is disabled via /bin/false - true" do
    resource = load_resource("kernel_module", "sstfb")
    _(resource.blacklisted?).must_equal true
    _(resource.resource_id).must_equal "sstfb"
  end

  # 9
  it "Verify a kernel_module is not disabled via /bin/false - true " do
    resource = load_resource("kernel_module", "bridge")
    _(resource.blacklisted?).must_equal false
    _(resource.resource_id).must_equal "bridge"
  end

  # 10
  # unlisted bin/true,/bin/false
  it "Verify an unlisted kernel_module is not disabled via /bin/true - false" do
    resource = load_resource("kernel_module", "fakemod")
    _(resource.blacklisted?).must_equal false
    _(resource.resource_id).must_equal "fakemod"
  end

  # 11
  it "Verify an unlisted kernel_module is not disabled via /bin/false - false" do
    resource = load_resource("kernel_module", "fakemod")
    _(resource.blacklisted?).must_equal false
    _(resource.resource_id).must_equal "fakemod"
  end

  # 12
  # blacklisting
  it "Verify a kernel_module is blacklisted - true" do
    resource = load_resource("kernel_module", "floppy")
    _(resource.blacklisted?).must_equal true
    _(resource.resource_id).must_equal "floppy"
  end

  # 13
  it "Verify a kernel_module is not blacklisted - false" do
    resource = load_resource("kernel_module", "ssftb")
    _(resource.blacklisted?).must_equal false
    _(resource.resource_id).must_equal "ssftb"
  end

  # 14
  # unlisted moduled
  it "Verify an unlisted kernel_module is not `loaded` - false" do
    resource = load_resource("kernel_module", "not_a_module")
    _(resource.loaded?).must_equal false
    _(resource.resource_id).must_equal "not_a_module"
  end

  # 15
  it "Verify an unlisted kernel_module is not `disabled` - false" do
    resource = load_resource("kernel_module", "not_a_module")
    _(resource.disabled?).must_equal false
    _(resource.resource_id).must_equal "not_a_module"
  end

  # 16
  it "Verify an unlisted kernel_module is not blacklisted - false" do
    resource = load_resource("kernel_module", "not_a_module")
    _(resource.blacklisted?).must_equal false
    _(resource.resource_id).must_equal "not_a_module"
  end

  # 17
  it "Verify an unlisted kernel_module is not disabled_via_bin_true - false" do
    resource = load_resource("kernel_module", "not_a_module")
    _(resource.blacklisted?).must_equal false
    _(resource.resource_id).must_equal "not_a_module"
  end

  # 18
  it "Verify an unlisted kernel_module is not disabled_via_bin_false - false" do
    resource = load_resource("kernel_module", "not_a_module")
    _(resource.blacklisted?).must_equal false
    _(resource.resource_id).must_equal "not_a_module"
  end
end
