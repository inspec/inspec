# encoding: utf-8

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

require 'utils/convert'

class Group < Vulcano.resource(1)
  name 'group'

  def initialize(groupname, domain = nil)
    @group = groupname
    @domain = domain

    # select group manager
    @group_provider = nil
    case vulcano.os[:family]
    when 'ubuntu', 'debian', 'redhat', 'fedora', 'arch', 'darwin', 'freebsd'
      # use /etc/group
      @group_provider = UnixGroup.new(vulcano)
    when 'windows'
      @group_provider = WindowsGroup.new(vulcano)
    else
      return skip_resource 'The `group` resource is not supported on your OS yet.'
    end
  end

  # verifies if a group exists
  def exists?
    # ensure that we found one group
    !group_info.nil? && group_info.size > 0
  end

  def gid
    if group_info.nil? || group_info.size == 0
      return nil
    elsif group_info.size == 1
      # the default case should be one group
      return group_info[0][:gid]
    else
      # return array if we got multiple gids
      return group_info.map { |grp| grp[:gid] }
    end
  end

  # implements rspec has matcher, to be compatible with serverspec
  def has_gid?(compare_gid)
    gid == compare_gid
  end

  def local
    if group_info.nil? || group_info.size == 0
      return nil
    elsif group_info.size == 1
      # the default case should be one group
      return group_info[0][:local]
    else
      # return array if we got multiple gids
      return group_info.map { |grp| grp[:local] }
    end
  end

  private

  def group_info
    return @cache if !@cache.nil?
    @cache = @group_provider.group_info(@group, @domain) if !@group_provider.nil?
  end
end

class GroupInfo
  def initialize(vulcano)
    @vulcano = vulcano
  end
end

# implements generic unix groups via /etc/group
class UnixGroup < GroupInfo
  include Converter

  def group_info(group, _domain = nil)
    @vulcano.etc_group.where(name: group).groups.map { |grp|
      {
        name: grp[0],
        gid: convert_to_i(grp[2]),
      }
    }
  end
end

class WindowsGroup < GroupInfo
  def group_info(compare_group, compare_domain = nil)
    cmd = @vulcano.command('Get-WmiObject Win32_Group | Select-Object -Property Caption, Domain, Name, SID, LocalAccount | ConvertTo-Json')

    # cannot rely on exit code for now, successful command returns exit code 1
    # return nil if cmd.exit_status != 0, try to parse json
    begin
      groups = JSON.parse(cmd.stdout)
    rescue JSON::ParserError => _e
      return nil
    end

    # ensure we have an array of groups
    groups = [groups] if !groups.is_a?(Array)

    # reduce list
    groups.each_with_object([]) do |grp, grp_collection|
      # map object
      grp_info = {
        name: grp['Name'],
        domain: grp['Domain'],
        caption: grp['Caption'],
        gid: nil,
        sid: grp['SID'],
        local: grp['LocalAccount'],
      }
      grp_collection.push(grp_info) if grp_info[:name] == compare_group && (compare_domain.nil? || grp_info[:domain] == compare_domain)
    end
  end
end
