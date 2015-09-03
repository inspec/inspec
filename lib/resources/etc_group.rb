# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

# The file format consists of
# - group name
# - password
# - gid
# - group list, comma seperated list

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

  def groups
    entries.map{|x| x[0]}
  end

  def gids
    entries.map{|x| x[2]}
  end

  def users
    entries.map{|x| x[3].split(',') }.flatten
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
    conditions.each do |k,v|
      idx = fields[k.to_sym]
      next if idx.nil?
      res = res.map{|x| x[idx] == v.to_s}
    end
    @entries = res
    self
  end

  private

  def parse(path)
    @content = vulcano.file(path).content
    @content.split("\n").map do |line|
      line.split(':')
    end
  end

end
