require 'helper'
require 'inspec/utils/parser'

describe BsdMountParser do
  let (:parser) { Class.new() { include BsdMountParser }.new }

  describe '#parse_mount_options' do
    it 'parses nil content' do
      parser.parse_mount_options(nil).must_equal({})
    end

    it 'parses an empty mount line' do
      parser.parse_mount_options('').must_equal({})
    end

    it 'parses a valid mount line' do
      info = {
        :device => 'tank/tmp',
        :type => 'zfs',
        :options => ['local', 'noexec', 'nosuid', 'nfsv4acls'],
      }
      parser.parse_mount_options('tank/tmp on /tmp (zfs, local, noexec, nosuid, nfsv4acls)').must_equal(info)
    end
  end
end
