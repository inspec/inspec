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

class Group < Vulcano.resource(1)
  name 'group'

  def initialize(group)
    @group = group

    # select group manager
    @group_provider = nil
    case vulcano.os[:family]
    when 'ubuntu', 'debian', 'redhat', 'fedora', 'arch', 'darwin', 'freebsd'
      # use /etc/group
      @group_provider = UnixGroup.new(vulcano)
    else
      return skip_resource 'The `group` resource is not supported on your OS yet.'
    end
  end

  # verifies if a group exists
  def exists?
    # ensure that we found one group
    !group_info.nil? && !group_info.groups.nil? && group_info.groups.size > 0
  end

  def gid
    # the default case should be one group
    if group_info.gids.size == 1
      return group_info.gids[0]
    # return array if we got multiple gids
    elsif group_info.gids.size == 0
      return nil
    else
      return group_info.gids
    end
  end

  # implements rspec has matcher, to be compatible with serverspec
  def has_gid?(compare_gid)
    gid == compare_gid
  end

  private

  def group_info
    return @cache if !@cache.nil?
    @cache = @group_provider.group_info(@group) if !@group_provider.nil?
  end
end

class GroupInfo
  def initialize(vulcano)
    @vulcano = vulcano
  end
end

# implements generic unix id handling
class UnixGroup < GroupInfo
  def group_info(group)
    @vulcano.etc_group.where(name: group)
  end
end
