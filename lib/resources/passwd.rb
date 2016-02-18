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
      its('users') { should_not include 'forbidden_user' }
    end

    describe passwd.uids(0) do
      its('users') { should eq 'root' }
      its('count') { should eq 1 }
    end

    describe passwd.shells(/nologin/) do
      # find all users with a nologin shell
      its('users') { should_not include 'my_login_user' }
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
      condition = condition.to_s if condition.is_a? Integer
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
    Passwd.new(@path, content: content, filters: @filters + filters)
  end

  def usernames
    warn '[DEPRECATION] `passwd.usernames` is deprecated. Please use `passwd.users` instead. It will be removed in version 1.0.0.'
    users
  end

  def username
    warn '[DEPRECATION] `passwd.user` is deprecated. Please use `passwd.users` instead. It will be removed in version 1.0.0.'
    users[0]
  end

  def uid(x)
    warn '[DEPRECATION] `passwd.uid(arg)` is deprecated. Please use `passwd.uids(arg)` instead. It will be removed in version 1.0.0.'
    uids(x)
  end

  def users(name = nil)
    name.nil? ? map_data('user') : filter(user: name)
  end

  def passwords(password = nil)
    password.nil? ? map_data('password') : filter(password: password)
  end

  def uids(uid = nil)
    uid.nil? ? map_data('uid') : filter(uid: uid)
  end

  def gids(gid = nil)
    gid.nil? ? map_data('gid') : filter(gid: gid)
  end

  def homes(home = nil)
    home.nil? ? map_data('home') : filter(home: home)
  end

  def shells(shell = nil)
    shell.nil? ? map_data('shell') : filter(shell: shell)
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
    @params.map { |x| x[id] }
  end
end
