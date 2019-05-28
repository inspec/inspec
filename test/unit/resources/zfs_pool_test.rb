require 'helper'
require 'inspec/resource'

describe Inspec::Resources::ZfsPool do
  let(:loader) { MockLoader.new(:freebsd10) }
  let(:tank_resource) { loader.send('load_resource', 'zfs_pool', 'tank') }

  it 'parses the ZFS pool data properly' do
    tank_resource.send(:health).must_equal('ONLINE')
    tank_resource.send(:guid).must_equal('4711279777582057513')
    tank_resource.send(:failmode).must_equal('continue')
    tank_resource.send(:'feature@lz4_compress').must_equal('active')
  end
end
