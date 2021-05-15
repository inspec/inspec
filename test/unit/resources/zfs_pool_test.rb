require "helper"
require "inspec/resource"
require "inspec/resources/zfs_pool"

describe Inspec::Resources::ZfsPool do
  let(:loader) { MockLoader.new(:freebsd10) }
  let(:tank_resource) { loader.send("load_resource", "zfs_pool", "tank") }

  it "parses the ZFS pool data properly" do
    if _(tank_resource)
      _(tank_resource.send(:health)).must_equal("ONLINE")
      _(tank_resource.send(:guid)).must_equal("4711279777582057513")
      _(tank_resource.send(:failmode)).must_equal("continue")
      _(tank_resource.send(:'feature@lz4_compress')).must_equal("active")
    end
  end
end

describe Inspec::Resources::ZfsPool do
  let(:loader) { MockLoader.new(:centos7) }
  let(:tank_resource) { loader.send("load_resource", "zfs_pool", "tank") }

  it "parses the ZFS pool data properly" do
    if _(tank_resource)
      _(tank_resource.send(:health)).must_equal("ONLINE")
      _(tank_resource.send(:guid)).must_equal("4711279777582057513")
      _(tank_resource.send(:failmode)).must_equal("continue")
      _(tank_resource.send(:'feature@lz4_compress')).must_equal("active")
    end
  end
end

describe Inspec::Resources::ZfsPool do
  let(:loader) { MockLoader.new(:macos10_16) }
  let(:tank_resource) { loader.send("load_resource", "zfs_pool", "tank") }

  it "parses the ZFS pool data properly" do
    if _(tank_resource)
      _(tank_resource.resource_exception_message).must_equal("zfs is not installed")
    end
  end
end


describe Inspec::Resources::ZfsPool do
  it "parses the ZFS pool data properly" do
    resource = MockLoader.new(:macos10_16).load_resource("zfs_pool", "tank")
    _(resource.resource_exception_message).must_equal "zfs is not installed"
  end
end
