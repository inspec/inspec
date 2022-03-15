# If we can load the InSpec globals definition file...
require "inspec/globals"
# ... we can find the core test unit helper file
require "#{Inspec.src_root}/test/helper"

# Load (require) the resource library file
require_relative "../../../lib/inspec/resources/cgroup"

describe Inspec::Resources::Cgroup do
  it "works correctly with the constructor on the platform" do
    # Add contructor arguments to load_resource if needed
    resource = MockLoader.new("linux".to_sym).load_resource("cgroup")

    _(resource.has_bells?).must_equal true
    _(resource.shoe_size).must_equal 42
    _(resource.resource_id).must_equal "something special"
  end
end
