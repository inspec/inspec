require "helper"
require "inspec/resource"
require "inspec/resources/zfs_dataset"

describe Inspec::Resources::ZfsDataset do
  let(:loader) { MockLoader.new(:freebsd10) }
  let(:tank_tmp_resource) { loader.send("load_resource", "zfs_dataset", "tank/tmp") }

  it "parses the ZFS dataset data properly" do
    if _(tank_tmp_resource)
      _(tank_tmp_resource.send(:mountpoint)).must_equal("/tmp")
      _(tank_tmp_resource.send(:type)).must_equal("filesystem")
      _(tank_tmp_resource.send(:exec)).must_equal("off")
      _(tank_tmp_resource.send(:setuid)).must_equal("off")
    end
  end
end

describe Inspec::Resources::ZfsDataset do
  let(:loader) { MockLoader.new(:centos7) }
  let(:tank_tmp_resource) { loader.send("load_resource", "zfs_dataset", "tank/tmp") }

  it "parses the ZFS dataset data properly" do
    if _(tank_tmp_resource)
      _(tank_tmp_resource.send(:mountpoint)).must_equal("/tmp")
      _(tank_tmp_resource.send(:type)).must_equal("filesystem")
      _(tank_tmp_resource.send(:exec)).must_equal("off")
      _(tank_tmp_resource.send(:setuid)).must_equal("off")
    end
  end
end

describe Inspec::Resources::ZfsDataset do
  let(:loader) { MockLoader.new(:macos10_16) }
  let(:tank_resource) { loader.send("load_resource", "zfs_dataset", "tank") }

  it "parses the ZFS pool data properly" do
    if _(tank_resource)
      _(tank_resource.resource_exception_message).must_equal("zfs is not installed")
    end
  end
end

describe Inspec::Resources::ZfsDataset do
  it "parses the ZFS dataset properly" do
    resource = MockLoader.new(:macos10_16).load_resource("zfs_dataset", "tank")
    _(resource.resource_exception_message).must_equal "zfs is not installed"
  end
end

