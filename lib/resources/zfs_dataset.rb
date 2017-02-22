# encoding: utf-8
# author: Joseph Benden

module Inspec::Resources
  class ZfsDataset < Inspec.resource(1)
    name 'zfs_dataset'
    desc "
      Use the zfs_dataset InSpec audit resource to test if the named
      ZFS Dataset is present and/or has certain properties.
    "
    example "
      describe zfs_dataset('tank/tmp') do
        its('exec') { should eq('off') }
        its('setuid') { should eq('off') }
      end
    "

    def initialize(zfs_dataset)
      return skip_resource 'The `zfs_dataset` resource is not supported on your OS yet.' if !inspec.os.bsd?
      @zfs_dataset = zfs_dataset

      @params = gather
    end

    # method called by 'it { should exist }'
    def exists?
      inspec.command("/sbin/zfs get -Hp all #{@zfs_dataset}").exit_status == 0
    end

    def mounted?
      return false if !exists?
      inspec.mount(@params['mountpoint']).mounted?
    end

    def to_s
      "ZFS Dataset #{@zfs_dataset}"
    end

    def gather
      cmd = inspec.command("/sbin/zfs get -Hp all #{@zfs_dataset}")
      return nil if cmd.exit_status.to_i != 0

      # parse data
      cmd.stdout.chomp.split("\n").each_with_object(Hash.new(0)) do |line, h|
        t = line.split("\t")
        h[t[1].to_s] = t[2].to_s
      end
    end

    # override method
    def exec
      @params['exec']
    end

    # expose all parameters
    def method_missing(name)
      @params[name.to_s]
    end
  end
end
