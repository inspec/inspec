require "inspec/resources/command"

module Inspec::Resources
  class ZfsDataset < Inspec.resource(1)
    name "zfs_dataset"
    supports platform: "unix"
    desc "
      Use the zfs_dataset InSpec audit resource to test if the named
      ZFS Dataset is present and/or has certain properties.
    "
    example <<~EXAMPLE
      describe zfs_dataset('tank/tmp') do
        its('exec') { should eq('off') }
        its('setuid') { should eq('off') }
      end
    EXAMPLE

    def initialize(zfs_dataset)
      return skip_resource "The `zfs_dataset` resource is not supported on your OS yet." unless inspec.os.bsd? || inspec.os.linux?

      @zfs_dataset = zfs_dataset
      find_zfs = inspec.command("which zfs")
      @zfs_cmd = find_zfs.stdout.strip

      return skip_resource "zfs is not installed" if find_zfs.exit_status != 0

      @params = gather
    end

    # method called by 'it { should exist }'
    def exists?
      inspec.command("#{@zfs_cmd} get -Hp all #{@zfs_dataset}").exit_status == 0
    end

    def mounted?
      return false unless exists?

      inspec.mount(@params["mountpoint"]).mounted?
    end

    def resource_id
      @zfs_dataset || "ZFS Dataset"
    end

    def to_s
      "ZFS Dataset #{@zfs_dataset}"
    end

    def gather
      cmd = inspec.command("#{@zfs_cmd} get -Hp all #{@zfs_dataset}")
      return nil if cmd.exit_status.to_i != 0

      # parse data
      cmd.stdout.chomp.split("\n").each_with_object(Hash.new(0)) do |line, h|
        t = line.split("\t")
        h[t[1].to_s] = t[2].to_s
      end
    end

    # override method
    def exec
      @params["exec"]
    end

    # expose all parameters
    def method_missing(name)
      @params[name.to_s]
    end
  end
end
