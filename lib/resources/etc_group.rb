# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

# The file format consists of
# - group name
# - password
# - gid
# - group list, comma seperated list

include Serverspec::Type

class EtcGroup < Serverspec::Type::File

  attr_accessor :gid

  def to_s
    %Q[/etc/group]
  end

  def parse
    content().split("\n").map do |line|
      line.split(':')
    end
  end

  def entries
    @entries ||= parse
  end

  def groups
    entries.map{|x| x[0]}
  end

  def gids
    entries.map{|x| x[2]}
  end

  def users
    entries.map{|x| x[3].split(',') }
  end

  def where( conditions = {} )
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
      idx = fields[k]
      next if idx.nil?
      res = res.map{|x| x[idx] == v}
    end
    @entries = res
    self
  end

end

module Serverspec::Type
  def etc_group(path = nil)
    EtcGroup.new(path || '/etc/group')
  end
end