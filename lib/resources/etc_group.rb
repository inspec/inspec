# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

# The file format consists of
# - group name
# - password
# - gid
# - group list, comma seperated list
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

class EtcGroup < Vulcano.resource(1)
  name 'etc_group'

  attr_accessor :gid, :entries
  def initialize(path = nil)
    @path = path || '/etc/group'
    @entries = parse(@path)
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
    entries.map { |x| x[2] } if !entries.nil?
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

  def parse(path)
    @content = vulcano.file(path).content
    @content.split("\n").map do |line|
      line.split(':')
    end
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
