# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

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

require 'utils/convert'
require 'utils/parser'

module Inspec::Resources
  class EtcGroup < Inspec.resource(1)
    include Converter
    include CommentParser

    name 'etc_group'
    desc 'Use the etc_group InSpec audit resource to test groups that are defined on Linux and UNIX platforms. The /etc/group file stores details about each group---group name, password, group identifier, along with a comma-separate list of users that belong to the group.'
    example "
      describe etc_group do
        its('gids') { should_not contain_duplicates }
        its('groups') { should include 'my_user' }
        its('users') { should include 'my_user' }
      end
    "

    attr_accessor :gid, :entries
    def initialize(path = nil)
      @path = path || '/etc/group'
      @entries = parse_group(@path)

      # skip resource if it is not supported on current OS
      return skip_resource 'The `etc_group` resource is not supported on your OS.' \
      unless inspec.os.unix?
    end

    def groups(filter = nil)
      entries = filter || @entries
      entries.map { |x| x['name'] } if !entries.nil?
    end

    def gids(filter = nil)
      entries = filter || @entries
      entries.map { |x| x['gid'] } if !entries.nil?
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

      conditions.each do |k, v|
        idx = fields[k.to_sym]
        next if idx.nil?
        res = res.select { |x| x[idx] == v.to_s }
      end

      EtcGroupView.new(self, res)
    end

    def to_s
      '/etc/group'
    end

    private

    def parse_group(path)
      @content = inspec.file(path).content
      if @content.nil?
        skip_resource "Can't access group file in #{path}"
        return []
      end
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
