# encoding: utf-8
# copyright: 2016, Chef Software Inc.
# author: Dominik Richter
# author: Christoph Hartmann

require 'utils/filter'

# The file format consists of
# - user
# - password
# - last_change
# - min_days before password change
# - max_days until password change
# - warn_days before warning about expiry
# - inactive_days before deactivating the account
# - expiry_date when this account will expire

module Inspec::Resources
  class Shadow < Inspec.resource(1)
    name 'shadow'
    desc 'Use the shadow InSpec resource to test the contents of /etc/shadow, '\
         'which contains the following information for users that may log into '\
         'the system and/or as users that own running processes.'
    example "
      describe shadow do
        its('users') { should_not include 'forbidden_user' }
      end

      describe shadow.users('bin') do
        its('passwords') { should cmp 'x' }
        its('count') { should eq 1 }
      end
    "

    attr_reader :params
    attr_reader :lines

    def initialize(path = '/etc/shadow', opts = nil)
      opts ||= {}
      @path = path || '/etc/shadow'
      @raw_content = opts[:content] || inspec.file(@path).content
      @lines = @raw_content.to_s.split("\n")
      @filters = opts[:filters] || ''
      raise Inspec::Exceptions::ResourceSkipped, 'The `shadow` resource is not supported on your OS.' unless inspec.os.unix?
      @params = @lines.map { |l| parse_shadow_line(l) }
    end

    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:users, field: 'user')
          .add(:passwords, field: 'password')
          .add(:last_changes, field: 'last_change')
          .add(:min_days, field: 'min_days')
          .add(:max_days, field: 'max_days')
          .add(:warn_days, field: 'warn_days')
          .add(:inactive_days, field: 'inactive_days')
          .add(:expiry_dates, field: 'expiry_date')

    filter.add(:content) { |t, _|
      t.entries.map do |e|
        [e.user, e.password, e.last_change, e.min_days, e.max_days, e.warn_days, e.inactive_days, e.expiry_date].compact.join(':')
      end.join("\n")
    }

    filter.add(:count) { |i, _|
      i.entries.length
    }

    filter.connect(self, :params)

    def to_s
      f = @filters.empty? ? '' : ' with'+@filters
      "/etc/shadow#{f}"
    end

    private

    def map_data(id)
      @params.map { |x| x[id] }
    end

    # Parse a line of /etc/shadow
    #
    # @param [String] line a line of /etc/shadow
    # @return [Hash] Map of entries in this line
    def parse_shadow_line(line)
      x = line.split(':')
      {
        'user'          => x.at(0),
        'password'      => x.at(1),
        'last_change'   => x.at(2),
        'min_days'      => x.at(3),
        'max_days'      => x.at(4),
        'warn_days'     => x.at(5),
        'inactive_days' => x.at(6),
        'expiry_date'   => x.at(7),
        'reserved'      => x.at(8),
      }
    end
  end
end
