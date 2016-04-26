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
require 'utils/filter'

module Inspec::Resources
  class Passwd < Inspec.resource(1)
    name 'passwd'
    desc 'Use the passwd InSpec audit resource to test the contents of /etc/passwd, which contains the following information for users that may log into the system and/or as users that own running processes.'
    example "
      describe passwd do
        its('users') { should_not include 'forbidden_user' }
      end

      describe passwd.uids(0) do
        its('users') { should cmp 'root' }
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
      @params = parse_passwd(@content)
    end

    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:users,     field: 'user')
          .add(:passwords, field: 'password')
          .add(:uids,      field: 'uid')
          .add(:gids,      field: 'gid')
          .add(:homes,     field: 'home')
          .add(:shells,    field: 'shell')
          .connect(self, :params)

    def usernames
      warn '[DEPRECATION] `passwd.usernames` is deprecated. Please use `passwd.users` instead. It will be removed in version 1.0.0.'
      users
    end

    def username
      warn '[DEPRECATION] `passwd.username` is deprecated. Please use `passwd.users` instead. It will be removed in version 1.0.0.'
      users[0]
    end

    def uid(x)
      warn '[DEPRECATION] `passwd.uid(arg)` is deprecated. Please use `passwd.uids(arg)` instead. It will be removed in version 1.0.0.'
      uids(x)
    end

    def count
      warn '[DEPRECATION] `passwd.count` is deprecated. Please use `passwd.entries.length` instead. It will be removed in version 1.0.0.'
      @params.length
    end

    def to_s
      '/etc/passwd'
    end
  end
end
