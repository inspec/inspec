# encoding: utf-8
# author: Joseph Benden

module Inspec::Resources
  class ZfsPool < Inspec.resource(1)
    name 'zfs_pool'
    desc "
      Use the zfs_pool InSpec audit resource to test if the named
      ZFS Pool is present and/or has certain properties.
    "
    example "
      describe zfs_pool('tank') do
        its('failmode') { should eq('continue') }
      end
    "

    def initialize(zfs_pool)
      return skip_resource 'The `zfs_pool` resource is not supported on your OS yet.' if !inspec.os.bsd?
      @zfs_pool = zfs_pool

      @params = gather
    end

    # method called by 'it { should exist }'
    def exists?
      inspec.command("/sbin/zpool get -Hp all #{@zfs_pool}").exit_status == 0
    end

    def to_s
      "ZFS Pool #{@zfs_pool}"
    end

    def gather
      cmd = inspec.command("/sbin/zpool get -Hp all #{@zfs_pool}")
      return nil if cmd.exit_status.to_i != 0

      # parse data
      cmd.stdout.chomp.split("\n").each_with_object(Hash.new(0)) do |line, h|
        t = line.split("\t")
        h[t[1].to_s] = t[2].to_s
      end
    end

    # expose all parameters
    def method_missing(name)
      @params[name.to_s]
    end
  end
end
