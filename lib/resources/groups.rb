# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'utils/filter'

module Inspec::Resources
  # This file contains two resources, the `group` and `groups` resource.
  # The `group` resource is optimized for requests that verify specific groups
  # that you know upfront for testing. If you need to query all groups or search
  # specific groups with certain properties, use the `groups` resource.
  module GroupManagementSelector
    # select group provider based on the operating system
    # returns nil, if no group manager was found for the operating system
    def select_group_manager(os)
      if os.unix?
        @group_provider = UnixGroup.new(inspec)
      elsif os.windows?
        @group_provider = WindowsGroup.new(inspec)
      end
    end
  end

  class Groups < Inspec.resource(1)
    include GroupManagementSelector

    name 'groups'
    desc 'Use the group InSpec audit resource to test groups on the system. Groups can be filtered.'
    example "
      describe groups.where { name == 'root'} do
        its('names') { should eq ['root'] }
        its('gids') { should eq [0] }
      end

      describe groups.where { name == 'Administrators'} do
        its('names') { should eq ['Administrators'] }
        its('gids') { should eq ['S-1-5-32-544'] }
      end
    "

    def initialize
      # select group manager
      @group_provider = select_group_manager(inspec.os)
      return skip_resource 'The `groups` resource is not supported on your OS yet.' if @group_provider.nil?
    end

    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:names,     field: 'name')
          .add(:gids,      field: 'gid')
          .add(:domains,   field: 'domain')
          .add(:exists?) { |x| !x.entries.empty? }
    filter.connect(self, :collect_group_details)

    def to_s
      'Groups'
    end

    private

    # collects information about every group
    def collect_group_details
      return @groups_cache ||= @group_provider.groups unless @group_provider.nil?
      []
    end
  end

  # Usage:
  # describe group('root') do
  #   it { should exist }
  #   its('gid') { should eq 0 }
  # end
  #
  # deprecated has matcher
  # describe group('root') do
  #  it { should have_gid 0 }
  # end
  class Group < Inspec.resource(1)
    include GroupManagementSelector

    name 'group'
    desc 'Use the group InSpec audit resource to test groups on the system.'
    example "
      describe group('root') do
        it { should exist }
        its('gid') { should eq 0 }
      end
    "

    def initialize(groupname)
      @group = groupname
      @group = @group.downcase unless inspec.os.windows?

      # select group manager
      @group_provider = select_group_manager(inspec.os)
      return skip_resource 'The `group` resource is not supported on your OS yet.' if @group_provider.nil?
    end

    # verifies if a group exists
    def exists?
      !group_info.entries.empty?
    end

    def gid
      gids = group_info.gids
      if gids.empty?
        nil
      # the default case should be one group
      elsif gids.size == 1
        gids.entries[0]
      else
        raise 'found more than one group with the same name, please use `groups` resource'
      end
    end

    # implements rspec has matcher, to be compatible with serverspec
    def has_gid?(compare_gid)
      gid == compare_gid
    end

    def local
      # at this point the implementation only returns local groups
      true
    end

    def to_s
      "Group #{@group}"
    end

    private

    def group_info
      # we need a local copy for the block
      group = @group.dup
      @groups_cache ||= inspec.groups.where { name == group }
    end
  end

  class GroupInfo
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end

    def groups
      raise 'group provider must implement the `groups` method'
    end
  end

  # implements generic unix groups via /etc/group
  class UnixGroup < GroupInfo
    def groups
      inspec.etc_group.entries
    end
  end

  class WindowsGroup < GroupInfo
    # returns all local groups
    def groups
      script = <<-EOH
Function  ConvertTo-SID { Param([byte[]]$BinarySID)
  (New-Object  System.Security.Principal.SecurityIdentifier($BinarySID,0)).Value
}

$Computername =  $Env:Computername
$adsi  = [ADSI]"WinNT://$Computername"
$groups = $adsi.Children | where {$_.SchemaClassName -eq  'group'} |  ForEach {
  $name = $_.Name[0]
  $sid = ConvertTo-SID -BinarySID $_.ObjectSID[0]
  $group =[ADSI]$_.Path
  new-object psobject -property @{name = $group.Name[0]; gid = $sid; domain=$Computername}
}
$groups | ConvertTo-Json -Depth 3
      EOH
      cmd = inspec.powershell(script)
      # cannot rely on exit code for now, successful command returns exit code 1
      # return nil if cmd.exit_status != 0, try to parse json
      begin
        groups = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        return []
      end

      # ensure we have an array of groups
      groups = [groups] if !groups.is_a?(Array)
      groups
    end
  end
end
