# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

# The file format consists of
# - username
# - password
# - userid
# - groupid
# - user id info
# - home directory
# - command

class Passwd < Vulcano.resource(1)
  name 'passwd'

  attr_accessor :uid

  def initialize(path = nil, uid: nil)
    @path = path || '/etc/passwd'
    @content = vulcano.file(@path).content
    @parsed = parse(@content)
  end

  def to_s
    @path
  end

  def determine_uid ()
    uids = Array.new
    @parsed.each {|x|
      if ( x.at(2) == "#{@uid}") then
        uids.push(x.at(0))
      end
    }
    uids
  end

  def username
    uids = determine_uid()
    uids.at(0)
  end

  def count
    arr = determine_uid()
    arr.length
  end

  def map_data(id)
    @parsed.map {|x|
      x.at(id)
    }
  end

  def usernames
    map_data(0)
  end

  def passwords
    map_data(1)
  end

  def uids
    map_data(2)
  end

  def gids
    map_data(3)
  end

  def users
    @parsed.map {|x|
      {
        'name' => x.at(0),
        'password' => x.at(1),
        'uid' => x.at(2),
        'gid' => x.at(3),
        'desc' => x.at(4),
        'home' => x.at(5),
        'shell' => x.at(6)
      }
    }
  end

  private

  def parse(content)
    content.split("\n").map do |line|
      line.split(':')
    end
  end
end
