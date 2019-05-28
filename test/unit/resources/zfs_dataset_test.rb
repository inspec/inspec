require 'helper'
require 'inspec/resource'

describe Inspec::Resources::ZfsDataset do
  let(:loader) { MockLoader.new(:freebsd10) }
  let(:tank_tmp_resource) { loader.send('load_resource', 'zfs_dataset', 'tank/tmp') }

  it 'parses the ZFS dataset data properly' do
    tank_tmp_resource.send(:mountpoint).must_equal('/tmp')
    tank_tmp_resource.send(:type).must_equal('filesystem')
    tank_tmp_resource.send(:exec).must_equal('off')
    tank_tmp_resource.send(:setuid).must_equal('off')
  end
end
