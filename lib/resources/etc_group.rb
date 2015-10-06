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

class EtcGroup < Vulcano.resource(1)
  include Converter
  include ContentParser

  name 'etc_group'

  attr_accessor :gid, :entries
  def initialize(path = nil)
    @path = path || '/etc/group'
    @entries = parse_group(@path)

    # skip resource if it is not supported on current OS
    return skip_resource 'The `etc_group` resource is not supported on your OS.' \
    unless %w{ubuntu debian redhat fedora arch darwin freebsd}.include?(vulcano.os[:family])
  end

  def to_s
    @path
  end

  def groups(filter = nil)
    entries = filter || @entries
    entries.map { |x| x[0] } if !entries.nil?
  end

  def gids(filter = nil)
    entries = filter || @entries
    entries.map { |x| convert_to_i(x[2]) } if !entries.nil?
  end

  def users(filter = nil)
    entries = filter || @entries
    return nil if entries.nil?
    # filter the user entry
    res = entries.map { |x|
      x[3].split(',') if !x.nil? && !x[3].nil?
    }.flatten
    # filter nil elements
    res.reject { |x| x.nil? || x.empty? }
  end

  def where(conditions = {})
    return if conditions.empty?
    fields = {
      name: 0,
      group_name: 0,
      password: 1,
      gid: 2,
      group_id: 2,
      group_list: 3,
      users: 3,
    }
    res = entries
    conditions.each do |k, v|
      idx = fields[k.to_sym]
      next if idx.nil?
      res = res.select { |x| x[idx] == v.to_s }
    end
    EtcGroupView.new(self, res)
  end

  private

  def parse_group(path)
    @content = vulcano.file(path).content
    # iterate over each line and filter comments
    @content.split("\n").each_with_object([]) do |line, lines|
      grp_info = parse_group_line(line)
      lines.push(grp_info) if !grp_info.nil? && grp_info.size > 0
    end
  end

  def parse_group_line(line)
    opts = {
      comment_char: '#',
      standalone_comments: false,
    }
    line, _idx_nl = parse_comment_line(line, opts)
    line.split(':')
  end
end

# object that hold a specifc view on etc group
class EtcGroupView
  def initialize(parent, filter)
    @parent = parent
    @filter = filter
  end

  def groups
    @parent.groups(@filter)
  end

  def gids
    @parent.gids(@filter)
  end

  def users
    @parent.users(@filter)
  end
end
