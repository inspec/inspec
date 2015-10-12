# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

# The file format consists of
# - username
# - password
# - userid
# - groupid
# - user id info
# - home directory
# - command

# usage:
#
# describe passwd do
#   its(:usernames) { should eq 'root' }
#   its(:uids) { should eq 1 }
# end
#
# describe passwd.uid(0) do
#   its(:username) { should eq 'root' }
#   its(:count) { should eq 1 }
# end

require 'utils/parser'

class Passwd < Vulcano.resource(1)
  name 'passwd'

  include ContentParser

  attr_reader :uid
  attr_reader :parsed

  def initialize(path = nil)
    @path = path || '/etc/passwd'
    @content = vulcano.file(@path).content
    @parsed = parse_passwd(@content)
  end

  # call passwd().uid(0)
  # returns a seperate object with reference to this object
  def uid(uid)
    PasswdUid.new(self, uid)
  end

  def usernames
    map_data('name')
  end

  def passwords
    map_data('password')
  end

  def uids
    map_data('uid')
  end

  def gids
    map_data('gid')
  end

  def users
    @parsed.map {|x|
      x['name']
    }
  end

  def to_s
    '/etc/passwd'
  end

  private

  def map_data(id)
    @parsed.map {|x|
      x[id]
    }
  end
end

# object that hold a specifc uid view on passwd
class PasswdUid
  def initialize(passwd, uid)
    @passwd = passwd
    @users = @passwd.parsed.select { |x| x['uid'] == "#{uid}" }
  end

  def username
    @users.at(0)['name']
  end

  def count
    @users.size
  end
end
