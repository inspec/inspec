# encoding: utf-8
# copyright: 2016, Chef Software Inc.
# author: Dominik Richter
# author: Christoph Hartmann

require 'forwardable'

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

    extend Forwardable
    attr_reader :params
    attr_reader :content
    attr_reader :lines

    def initialize(path = '/etc/shadow', opts = nil)
      opts ||= {}
      @path = path || '/etc/shadow'
      @content = opts[:content] || inspec.file(@path).content
      @lines = @content.to_s.split("\n")
      @filters = opts[:filters] || ''
      @params = @lines.map { |l| parse_shadow_line(l) }
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
      Shadow.new(@path, content: content, filters: @filters + filters)
    end

    def entries
      @lines.map do |line|
        params = parse_shadow_line(line)
        Shadow.new(@path, content: line,
                   filters: "#{@filters} on entry user=#{params['user']}")
      end
    end

    def users(name = nil)
      name.nil? ? map_data('user') : filter(user: name)
    end

    def passwords(password = nil)
      password.nil? ? map_data('password') : filter(password: password)
    end

    def last_changes(filter_by = nil)
      filter_by.nil? ? map_data('last_change') : filter(last_change: filter_by)
    end

    def min_days(filter_by = nil)
      filter_by.nil? ? map_data('min_days') : filter(min_days: filter_by)
    end

    def max_days(filter_by = nil)
      filter_by.nil? ? map_data('max_days') : filter(max_days: filter_by)
    end

    def warn_days(filter_by = nil)
      filter_by.nil? ? map_data('warn_days') : filter(warn_days: filter_by)
    end

    def inactive_days(filter_by = nil)
      filter_by.nil? ? map_data('inactive_days') : filter(inactive_days: filter_by)
    end

    def expiry_dates(filter_by = nil)
      filter_by.nil? ? map_data('expiry_date') : filter(expiry_date: filter_by)
    end

    def to_s
      f = @filters.empty? ? '' : ' with'+@filters
      "/etc/shadow#{f}"
    end

    def_delegator :@params, :length, :count

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
