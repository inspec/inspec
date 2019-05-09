
require 'inspec/utils/filter'

module Inspec::Resources
  # This file contains two resources, the `group` and `groups` resource.
  # The `group` resource is optimized for requests that verify specific groups
  # that you know upfront for testing. If you need to query all groups or search
  # specific groups with certain properties, use the `groups` resource.
  module GroupManagementSelector
    # select group provider based on the operating system
    # returns nil, if no group manager was found for the operating system
    def select_group_manager(os)
      @group_provider = if os.darwin?
                          DarwinGroup.new(inspec)
                        elsif os.unix?
                          UnixGroup.new(inspec)
                        elsif os.windows?
                          WindowsGroup.new(inspec)
                        end
    end
  end

  class Groups < Inspec.resource(1)
    include GroupManagementSelector

    name 'groups'
    supports platform: 'unix'
    supports platform: 'windows'
    desc 'Use the group InSpec audit resource to test groups on the system. Groups can be filtered.'
    example <<~EXAMPLE
      describe groups.where { name == 'root'} do
        its('names') { should eq ['root'] }
        its('gids') { should eq [0] }
      end

      describe groups.where { name == 'Administrators'} do
        its('names') { should eq ['Administrators'] }
        its('gids') { should eq ['S-1-5-32-544'] }
      end
    EXAMPLE

    def initialize
      # select group manager
      @group_provider = select_group_manager(inspec.os)
      return skip_resource 'The `groups` resource is not supported on your OS yet.' if @group_provider.nil?
    end

    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
    filter.register_column(:names,     field: 'name')
          .register_column(:gids,      field: 'gid')
          .register_column(:domains,   field: 'domain')
          .register_column(:members,   field: 'members', style: :simple)
    filter.install_filter_methods_on_resource(self, :collect_group_details)

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
  class Group < Inspec.resource(1)
    include GroupManagementSelector

    name 'group'
    supports platform: 'unix'
    supports platform: 'windows'
    desc 'Use the group InSpec audit resource to test groups on the system.'
    example <<~EXAMPLE
      describe group('root') do
        it { should exist }
        its('gid') { should eq 0 }
      end

      describe group('Administrators') do
        its('members') { should include 'Administrator' }
      end
    EXAMPLE

    def initialize(groupname)
      @group = groupname

      # select group manager
      @group_provider = select_group_manager(inspec.os)
      return skip_resource 'The `group` resource is not supported on your OS yet.' if @group_provider.nil?
    end

    # verifies if a group exists
    def exists?
      !group_info.entries.empty?
    end

    def gid
      flatten_entry(group_info, 'gid')
    end

    def members
      flatten_entry(group_info, 'members')
    end

    def local
      # at this point the implementation only returns local groups
      true
    end

    def to_s
      "Group #{@group}"
    end

    private

    def flatten_entry(group_info, prop)
      entries = group_info.entries
      if entries.empty?
        nil
      elsif entries.size == 1
        entries.first.send(prop)
      else
        raise 'found more than one group with the same name, please use `groups` resource'
      end
    end

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

  # OSX uses opendirectory for groups, so `/etc/group` may not be fully accurate
  # This uses `dscacheutil` to get the group info instead of `etc_group`
  class DarwinGroup < GroupInfo
    def groups
      group_info = inspec.command('dscacheutil -q group').stdout.split("\n\n")

      groups = []
      regex = /^([^:]*?)\s*:\s(.*?)\s*$/
      group_info.each do |data|
        groups << inspec.parse_config(data, assignment_regex: regex).params
      end

      # Convert the `dscacheutil` groups to match `inspec.etc_group.entries`
      groups.each { |g| g['gid'] = g['gid'].to_i }
      groups.each do |g|
        next if g['users'].nil?
        g['members'] = g.delete('users')
        g['members'].tr!(' ', ',')
      end
    end
  end

  class WindowsGroup < GroupInfo
    # returns all local groups
    def groups
      script = <<-EOH
        Function ConvertTo-SID { Param([byte[]]$BinarySID)
          (New-Object System.Security.Principal.SecurityIdentifier($BinarySID,0)).Value
        }
        $Computername = $Env:Computername
        $adsi = [ADSI]"WinNT://$Computername"
        $groups = $adsi.Children | where {$_.SchemaClassName -eq 'group'} | ForEach {
          $name = $_.Name[0]
          $sid = ConvertTo-SID -BinarySID $_.ObjectSID[0]
          $group =[ADSI]$_.Path
          $members = $_.Members() | Foreach-Object { $_.GetType().InvokeMember('Name', 'GetProperty', $null, $_, $null) }
          # An empty collection of these objects isn't properly converted to an empty array by ConvertTo-Json
          if(-not [bool]$members) {
            $members = @()
          }
          new-object psobject -property @{name = $group.Name[0]; gid = $sid; domain = $Computername; members = $members}
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
      groups = [groups] unless groups.is_a?(Array)
      groups
    end
  end
end
