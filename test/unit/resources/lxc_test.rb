# Load (require) the InSpec globals definition file.
require "inspec/globals"
# Load (require) the core test unit helper file
require "#{Inspec.src_root}/test/helper"
# Load (require) the resource library file
require_relative "../../../lib/inspec/resources/lxc"

describe "Inspec::Resources::Lxc" do
  # ubuntu
  it "verify lxc resource on ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("lxc", "my-ubuntu-container")
    _(resource.exists?).must_equal true
    _(resource.running?).must_equal true
    _(resource.resource_skipped?).must_equal false
  end

  # # ubuntu
  it "verify lxc resource on ubuntu for non exisiting container" do
    resource = MockLoader.new(:ubuntu).load_resource("lxc", "my-ubuntu-container-1")
    _(resource.exists?).must_equal false
    _(resource.running?).must_equal false
    _(resource.resource_skipped?).must_equal false
  end

  # windows
  it "verify lxc resource on windows" do
    resource = MockLoader.new(:windows).load_resource("lxc", "my-ubuntu-container")
    _(resource.resource_skipped?).must_equal true
    _(resource.resource_exception_message).must_equal "The `lxc` resource is not supported on your OS yet."
  end

  # undefined
  it "verify lxc resource on unsupported os" do
    resource = MockLoader.new(:undefined).load_resource("lxc", "my-ubuntu-container")
    _(resource.resource_skipped?).must_equal true
    _(resource.resource_exception_message).must_equal "The `lxc` resource is not supported on your OS yet."
  end
end