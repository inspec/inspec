require "helper"
require "inspec/resource"
require "inspec/resources/zfs_dataset"

describe Inspec::Resources::ZfsDataset do
  let(:loader) { MockLoader.new(:freebsd10) }
  let(:tank_tmp_resource) { loader.send("load_resource", "zfs_dataset", "tank/tmp") }

  it "parses the ZFS dataset data properly" do
    _(tank_tmp_resource.send(:mountpoint)).must_equal("/tmp")
    _(tank_tmp_resource.send(:type)).must_equal("filesystem")
    _(tank_tmp_resource.send(:exec)).must_equal("off")
    _(tank_tmp_resource.send(:setuid)).must_equal("off")
  end
end
