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

require 'utils/parser'

class Passwd < Inspec.resource(1)
  name 'passwd'
  desc 'Use the passwd InSpec audit resource to test the contents of /etc/passwd, which contains the following information for users that may log into the system and/or as users that own running processes.'
  example "
    describe passwd do
      its('usernames') { should_not include 'forbidden_user' }
    end

    describe passwd.uid(0) do
      its('username') { should eq 'root' }
      its('count') { should eq 1 }
    end

    describe passwd.name(/oot/) do
      ...
    end
  "

  include PasswdParser

  attr_reader :uid
  attr_reader :params
  attr_reader :content
  attr_reader :lines

  def initialize(path = nil, opts = nil)
    opts ||= {}
    @path = path || '/etc/passwd'
    @content = opts[:content] || inspec.file(@path).content
    @lines = @content.to_s.split("\n")
    @filters = opts[:filters] || ''
    @params = parse_passwd(@content)
  end

  def filter(hm = {})
    return self if hm.nil? || hm.empty?
    res = @params
    filters = ''
    hm.each do |attr, condition|
      filters += " #{attr} = #{condition.inspect}"
      res = res.find_all do |line|
        case line[attr.to_s]
        when condition
          true
        else
          false
        end
      end
    end
    content = res.map { |x| x.values.join(':') }.join("\n")
    Passwd.new(@path, content, @filters + filters)
  end

  def usernames
    warn '[DEPRECATION] `passwd.usernames` is deprecated. Please use `passwd.users` instead.'
    users
  end

  def users
    map_data('user')
  end

  def user(name)
    filter(name: name)
  end

  def passwords
    map_data('password')
  end

  def password(pw)
    filter(password: pw)
  end

  def uids
    map_data('uid')
  end

  def uid(uid)
    filter(uid: uid)
  end

  def gids
    map_data('gid')
  end

  def gid(gid)
    filter(gid: gid)
  end

  def to_s
    f = @filters.empty? ? '' : ' with'+@filters
    "/etc/passwd#{f}"
  end

  def count
    @params.length
  end

  private

  def map_data(id)
    @params.map {|x|
      x[id]
    }
  end
end
