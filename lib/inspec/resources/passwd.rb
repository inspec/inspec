# copyright: 2015, Vulcano Security GmbH

# The file format consists of
# - username
# - password
# - userid
# - groupid
# - user id info
# - home directory
# - command

require 'inspec/utils/parser'
require 'inspec/utils/filter'
require 'inspec/utils/file_reader'

module Inspec::Resources
  class Passwd < Inspec.resource(1)
    name 'passwd'
    supports platform: 'unix'
    desc 'Use the passwd InSpec audit resource to test the contents of /etc/passwd, which contains the following information for users that may log into the system and/or as users that own running processes.'
    example <<~EXAMPLE
      describe passwd do
        its('users') { should_not include 'forbidden_user' }
      end

      describe passwd.uids(0) do
        its('users') { should cmp 'root' }
      end

      describe passwd.shells(/nologin/) do
        # find all users with a nologin shell
        its('users') { should_not include 'my_login_user' }
      end
    EXAMPLE

    include PasswdParser
    include FileReader

    attr_reader :params
    attr_reader :content
    attr_reader :lines

    def initialize(path = nil, opts = nil)
      opts ||= {}
      @path = path || '/etc/passwd'
      @content = opts[:content] || read_file_content(@path, allow_empty: true)
      @lines = @content.to_s.split("\n")
      @params = parse_passwd(@content)
    end

    filter = FilterTable.create
    filter.register_column(:users,     field: 'user')
          .register_column(:passwords, field: 'password')
          .register_column(:uids,      field: 'uid')
          .register_column(:gids,      field: 'gid')
          .register_column(:descs,     field: 'desc')
          .register_column(:homes,     field: 'home')
          .register_column(:shells,    field: 'shell')

    # rebuild the passwd line from raw content
    filter.register_custom_property(:content) { |t, _|
      t.entries.map do |e|
        [e.user, e.password, e.uid, e.gid, e.desc, e.home, e.shell].join(':')
      end.join("\n")
    }

    filter.install_filter_methods_on_resource(self, :params)

    def to_s
      '/etc/passwd'
    end
  end
end
