
require 'inspec/utils/parser'
require 'inspec/utils/filter'

module Inspec::Resources
  class Crontab < Inspec.resource(1)
    name 'crontab'
    supports platform: 'unix'
    desc 'Use the crontab InSpec audit resource to test the contents of the crontab for a given user which contains information about scheduled tasks owned by that user.'
    example <<~EXAMPLE
      describe crontab(user: 'root') do
        its('commands') { should include '/path/to/some/script' }
      end

      describe crontab('myuser').commands('/home/myuser/build.sh') do
        its('hours') { should cmp '*' }
        its('minutes') { should cmp '*' }
      end

      describe crontab.where({'hour' => '*', 'minute' => '*'}) do
        its('entries.length') { should cmp '0' }
      end

      describe crontab.where { command =~ /a partial command string/ } do
        its('entries.length') { should cmp 1 }
      end

      describe crontab(path: '/etc/cron.d/some_crontab') do
        its('commands') { should include '/path/to/some/script' }
      end
    EXAMPLE

    attr_reader :params

    include CommentParser

    def initialize(opts = nil)
      if opts.respond_to?(:fetch)
        Hash[opts.map { |k, v| [k.to_sym, v] }]
        @user = opts.fetch(:user, nil)
        @path = opts.fetch(:path, nil)
        raise Inspec::Exceptions::ResourceFailed, 'A user or path must be supplied.' if @user.nil? && @path.nil?
        raise Inspec::Exceptions::ResourceFailed, 'Either user or path must be supplied, not both!' if !@user.nil? && !@path.nil?
      else
        @user = opts
        @path = nil
      end
      @params = read_crontab
    end

    def read_crontab
      if is_system_crontab?
        raise Inspec::Exceptions::ResourceFailed, "Supplied crontab path '#{@path}' must exist!" if !inspec.file(@path).exist?
        ct = inspec.file(@path).content
      else
        ct = inspec.command(crontab_cmd).stdout
      end
      ct.lines.map { |l| parse_crontab_line(l) }.compact
    end

    def parse_crontab_line(l)
      data, = parse_comment_line(l, comment_char: '#', standalone_comments: false)
      return nil if data.nil? || data.empty?

      is_system_crontab? ? parse_system_crontab(data) : parse_user_crontab(data)
    end

    def crontab_cmd
      @user.nil? ? 'crontab -l' : "crontab -l -u #{@user}"
    end

    filter = FilterTable.create
    filter.register_column(:minutes,  field: 'minute')
          .register_column(:hours,    field: 'hour')
          .register_column(:days,     field: 'day')
          .register_column(:months,   field: 'month')
          .register_column(:weekdays, field: 'weekday')
          .register_column(:user,     field: 'user')
          .register_column(:commands, field: 'command')

    # rebuild the crontab line from raw content
    filter.register_custom_property(:content) { |t, _|
      t.entries.map do |e|
        [e.minute, e.hour, e.day, e.month, e.weekday, e.user, e.command].compact.join(' ')
      end.join("\n")
    }

    filter.install_filter_methods_on_resource(self, :params)

    def to_s
      if is_system_crontab?
        "crontab for path #{@path}"
      elsif is_user_crontab?
        "crontab for user #{@user}"
      else
        'crontab for current user'
      end
    end

    private

    def is_system_crontab?
      !@path.nil?
    end

    def is_user_crontab?
      !@user.nil?
    end

    def parse_system_crontab(data)
      case data
      when /@hourly .*/
        elements = data.split(/\s+/, 3)
        { 'minute' => '0', 'hour' => '*', 'day' => '*', 'month' => '*', 'weekday' => '*', 'user' => elements.at(1), 'command' => elements.at(2) }
      when /@(midnight|daily) .*/
        elements = data.split(/\s+/, 3)
        { 'minute' => '0', 'hour' => '0', 'day' => '*', 'month' => '*', 'weekday' => '*', 'user' => elements.at(1), 'command' => elements.at(2) }
      when /@weekly .*/
        elements = data.split(/\s+/, 3)
        { 'minute' => '0', 'hour' => '0', 'day' => '*', 'month' => '*', 'weekday' => '0', 'user' => elements.at(1), 'command' => elements.at(2) }
      when /@monthly ./
        elements = data.split(/\s+/, 3)
        { 'minute' => '0', 'hour' => '0', 'day' => '1', 'month' => '*', 'weekday' => '*', 'user' => elements.at(1), 'command' => elements.at(2) }
      when /@(annually|yearly) .*/
        elements = data.split(/\s+/, 3)
        { 'minute' => '0', 'hour' => '0', 'day' => '1', 'month' => '1', 'weekday' => '*', 'user' => elements.at(1), 'command' => elements.at(2) }
      when /@reboot .*/
        elements = data.split(/\s+/, 3)
        { 'minute' => '-1', 'hour' => '-1', 'day' => '-1', 'month' => '-1', 'weekday' => '-1', 'user' => elements.at(1), 'command' => elements.at(2) }
      else
        elements = data.split(/\s+/, 7)
        {
          'minute'  => elements.at(0),
          'hour'    => elements.at(1),
          'day'     => elements.at(2),
          'month'   => elements.at(3),
          'weekday' => elements.at(4),
          'user'    => elements.at(5),
          'command' => elements.at(6),
        }
      end
    end

    def parse_user_crontab(data)
      case data
      when /@hourly .*/
        { 'minute' => '0', 'hour' => '*', 'day' => '*', 'month' => '*', 'weekday' => '*', 'user' => @user, 'command' => data.split(/\s+/, 2).at(1) }
      when /@(midnight|daily) .*/
        { 'minute' => '0', 'hour' => '0', 'day' => '*', 'month' => '*', 'weekday' => '*', 'user' => @user, 'command' => data.split(/\s+/, 2).at(1) }
      when /@weekly .*/
        { 'minute' => '0', 'hour' => '0', 'day' => '*', 'month' => '*', 'weekday' => '0', 'user' => @user, 'command' => data.split(/\s+/, 2).at(1) }
      when /@monthly ./
        { 'minute' => '0', 'hour' => '0', 'day' => '1', 'month' => '*', 'weekday' => '*', 'user' => @user, 'command' => data.split(/\s+/, 2).at(1) }
      when /@(annually|yearly) .*/
        { 'minute' => '0', 'hour' => '0', 'day' => '1', 'month' => '1', 'weekday' => '*', 'user' => @user, 'command' => data.split(/\s+/, 2).at(1) }
      when /@reboot .*/
        { 'minute' => '-1', 'hour' => '-1', 'day' => '-1', 'month' => '-1', 'weekday' => '-1', 'user' => @user, 'command' => data.split(/\s+/, 2).at(1) }
      else
        elements = data.split(/\s+/, 6)
        {
          'minute'  => elements.at(0),
          'hour'    => elements.at(1),
          'day'     => elements.at(2),
          'month'   => elements.at(3),
          'weekday' => elements.at(4),
          'user'    => @user,
          'command' => elements.at(5),
        }
      end
    end
  end
end
