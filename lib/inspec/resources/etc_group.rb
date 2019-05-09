# copyright: 2015, Vulcano Security GmbH

# The file format consists of
# - group name
# - password - group's encrypted password
# - gid - group's decimal ID
# - member list - group members, comma seperated list
#
# Usage:
# describe etc_group do
#   its('gids') { should_not contain_duplicates }
#   its('groups') { should include 'my_user' }
#   its('users') { should include 'my_user' }
# end
#
# describe etc_group.where(name: 'my_group') do
#   its('users') { should include 'my_user' }
# end

require 'inspec/utils/convert'
require 'inspec/utils/parser'
require 'inspec/utils/file_reader'

module Inspec::Resources
  class EtcGroup < Inspec.resource(1)
    include Converter
    include CommentParser

    name 'etc_group'
    supports platform: 'unix'
    desc 'Use the etc_group InSpec audit resource to test groups that are defined on Linux and UNIX platforms. The /etc/group file stores details about each group---group name, password, group identifier, along with a comma-separate list of users that belong to the group.'
    example <<~EXAMPLE
      describe etc_group do
        its('gids') { should_not contain_duplicates }
        its('groups') { should include 'my_user' }
        its('users') { should include 'my_user' }
      end
    EXAMPLE

    include FileReader

    attr_accessor :gid, :entries
    def initialize(path = nil)
      @path = path || '/etc/group'
      @entries = parse_group(@path)
    end

    def groups(filter = nil)
      (filter || @entries)&.map { |x| x['name'] }
    end

    def gids(filter = nil)
      (filter || @entries)&.map { |x| x['gid'] }
    end

    def users(filter = nil)
      entries = filter || @entries
      return nil if entries.nil?
      # filter the user entry
      res = entries.map { |x|
        x['members'].split(',') if !x.nil? && !x['members'].nil?
      }.flatten
      # filter nil elements
      res.reject { |x| x.nil? || x.empty? }
    end

    def where(conditions = {})
      return if conditions.empty?
      fields = {
        name: 'name',
        group_name: 'name',
        password: 'password',
        gid: 'gid',
        group_id: 'gid',
        users: 'members',
        members: 'members',
      }
      res = entries

      unless res.nil?
        conditions.each do |k, v|
          idx = fields[k.to_sym]
          next if idx.nil?
          res = res.select { |x| x[idx].to_s == v.to_s }
        end
      end

      EtcGroupView.new(self, res)
    end

    def to_s
      '/etc/group'
    end

    private

    def parse_group(path)
      @content = read_file_content(path, allow_empty: true)

      # iterate over each line and filter comments
      @content.split("\n").each_with_object([]) do |line, lines|
        grp_info = parse_group_line(line)
        lines.push(grp_info) if !grp_info.nil? && !grp_info.empty?
      end
    end

    def parse_group_line(line)
      opts = {
        comment_char: '#',
        standalone_comments: false,
      }
      line, _idx_nl = parse_comment_line(line, opts)
      x = line.split(':')
      # abort if we have an empty or comment line
      return nil if x.empty?
      # map data
      {
        'name' => x.at(0), # Name of the group.
        'password' => x.at(1), # Group's encrypted password.
        'gid' => convert_to_i(x.at(2)), # The group's decimal ID.
        'members' => x.at(3), # Group members.
      }
    end
  end

  # object that hold a specifc view on etc group
  class EtcGroupView
    def initialize(parent, filter)
      @parent = parent
      @filter = filter
    end

    # returns the group object
    def entries
      @filter
    end

    # only returns group name
    def groups
      @parent.groups(@filter)
    end

    # only return gids
    def gids
      @parent.gids(@filter)
    end

    # only returns users
    def users
      @parent.users(@filter)
    end
  end
end
