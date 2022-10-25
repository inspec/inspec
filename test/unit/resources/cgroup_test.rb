require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/cgroup"

describe Inspec::Resources::Cgroup do
  # ubuntu
  it "check carrotking cgroup information on ubuntu" do
    resource = MockLoader.new("ubuntu".to_sym).load_resource("cgroup", "carrotking")
    _(resource.cpuset.cpus).must_equal 0
    _(resource.memory.stat).must_match(/hierarchical_memory_limit 9223372036854771712/)
  end

  # debian
  it "check carrotking cgroup information on debian" do
    resource = MockLoader.new("debian8".to_sym).load_resource("cgroup", "carrotking")
    _(resource.cpuset.cpus).must_equal 0
    _(resource.memory.stat).must_match(/hierarchical_memory_limit 9223372036854771712/)
  end

  # windows
  it "check carrotking cgroup information on windows" do
    resource = MockLoader.new("windows".to_sym).load_resource("cgroup", "carrotking")
    _(resource.resource_skipped?).must_equal true
    _(resource.resource_exception_message).must_equal "The `cgroup` resource is not supported on your OS yet."
  end

  # undefined
  it "check carrotking cgroup information on unsupported os" do
    resource = MockLoader.new("exsi".to_sym).load_resource("cgroup", "carrotking")
    _(resource.resource_skipped?).must_equal true
    _(resource.resource_exception_message).must_equal "The `cgroup` resource is not supported on your OS yet."
  end
end
