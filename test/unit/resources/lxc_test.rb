# If we can load the InSpec globals definition file...
require "inspec/globals"
# ... we can find the core test unit helper file
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resource"
# Load (require) the resource library file
require_relative "../../../lib/inspec/resources/lxc"

describe "Inspec::Resources::Lxc" do
  # ubuntu
  it "verify lxc resource on ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("lxc", "my-ubuntu-container")
    _(resource.exists?).must_equal true
    _(resource.running?).must_equal true
  end

  # windows
  it "verify lxc resource on windows" do
    resource = MockLoader.new(:windows).load_resource("lxc", "my-ubuntu-container")
    _(resource.exists?).must_equal false
    _(resource.running?).must_equal false
  end

  # undefined
  it "verify lxc resource on unsupported os" do
    resource = MockLoader.new(:undefined).load_resource("lxc", "my-ubuntu-container")
    _(resource.exists?).must_equal false
  end
end
