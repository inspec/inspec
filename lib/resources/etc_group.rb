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
    entries = Array.new
    content().split("\n").each do |line|
      entries.push(line.split(':'))
    end
    entries
  end

  # verifies that the file contains the group
  def have_group ()
    parsed = parse()
    idx = parsed.index { |x| x[2] == @gid }
    if (idx >= 0) then
      res = true
    end
    res
  end

  def map_data (id)
    parsed = parse()
    parsed.map {|x|
      x[id]
    }
  end

  def groups
    map_data(0)
  end

  # find the gid for a group
  def group(name)
    parsed = parse()
    item = parsed.find { |x| 
      x[0] == name 
    }
    return nil if item.nil? 
    item[2]
  end

  def users
    parsed = parse()
    item = parsed.find { |x| 
      x[2] == @gid 
    }
    return Array.new if item.nil? 
    group_users = item[3]
    return Array.new if group_users.nil? 
    group_users.split(',')
  end

  def gids
    map_data(2)
  end
end
