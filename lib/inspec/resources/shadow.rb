# copyright: 2016, Chef Software Inc.

require 'inspec/utils/filter'
require 'inspec/utils/file_reader'

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
    supports platform: 'unix'
    desc 'Use the shadow InSpec resource to test the contents of /etc/shadow, '\
         'which contains information for users that may log into '\
         'the system and/or as users that own running processes.'
    example <<~EXAMPLE
      describe shadow do
        its('user') { should_not include 'forbidden_user' }
      end

      describe shadow.user('bin') do
        its('password') { should cmp 'x' }
        its('count') { should eq 1 }
      end
    EXAMPLE

    include FileReader

    attr_reader :params

    def initialize(path = '/etc/shadow', opts = {})
      @opts = opts
      @path = path || '/etc/shadow'
      @filters = @opts[:filters] || ''
    end

    filtertable = FilterTable.create
    filtertable
      .register_column(:users, field: 'user')
      .register_column(:passwords, field: 'password')
      .register_column(:last_changes, field: 'last_change')
      .register_column(:min_days, field: 'min_days')
      .register_column(:max_days, field: 'max_days')
      .register_column(:warn_days, field: 'warn_days')
      .register_column(:inactive_days, field: 'inactive_days')
      .register_column(:expiry_dates, field: 'expiry_date')
      .register_column(:reserved, field: 'reserved')
    # These are deprecated, but we need to "alias" them
    filtertable
      .register_custom_property(:user) { |table, value| table.resource.user(value) }
      .register_custom_property(:password) { |table, value| table.resource.password(value) }
      .register_custom_property(:last_change) { |table, value| table.resource.last_change(value) }
      .register_custom_property(:expiry_date) { |table, value| table.resource.expiry_date(value) }

    filtertable.register_custom_property(:content) { |t, _|
      t.entries.map do |e|
        [e.user, e.password, e.last_change, e.min_days, e.max_days, e.warn_days, e.inactive_days, e.expiry_date].compact.join(':')
      end.join("\n")
    }

    filtertable.install_filter_methods_on_resource(self, :set_params)

    def filter(query = {})
      return self if query.nil? || query.empty?
      res = set_params
      filters = ''
      query.each do |attr, condition|
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
      Shadow.new(@path, content: content, filters: @filters + filters)
    end

    # Next 4 are deprecated methods.  We define them here so we can emit a deprecation message.
    # They are also defined on the Table, above.
    def user(query = nil)
      Inspec.deprecate(:properties_shadow, 'The shadow `user` property is deprecated. Please use `users` instead.')
      query.nil? ? where.users : where('user' => query)
    end

    def password(query = nil)
      Inspec.deprecate(:properties_shadow, 'The shadow `password` property is deprecated. Please use `passwords` instead.')
      query.nil? ? where.passwords : where('password' => query)
    end

    def last_change(query = nil)
      Inspec.deprecate(:properties_shadow, 'The shadow `last_change` property is deprecated. Please use `last_changes` instead.')
      query.nil? ? where.last_changes : where('last_change' => query)
    end

    def expiry_date(query = nil)
      Inspec.deprecate(:properties_shadow, 'The shadow `expiry_date` property is deprecated. Please use `expiry_dates` instead.')
      query.nil? ? where.expiry_dates : where('expiry_date' => query)
    end

    def lines
      Inspec.deprecate(:properties_shadow, 'The shadow `lines` property is deprecated.')
      shadow_content.to_s.split("\n")
    end

    def to_s
      f = @filters.empty? ? '' : ' with'+@filters
      "#{@path}#{f}"
    end

    private

    def shadow_content
      @opts[:content] || read_file_content(@path, allow_empty: true)
    end

    def set_params
      @params ||= Array(shadow_content.to_s.split("\n")).map { |l| parse_shadow_line(l) }
    end

    def map_data(id)
      set_params.collect { |x| x[id] }
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
