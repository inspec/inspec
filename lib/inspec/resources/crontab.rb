require "inspec/resources/file"
require "inspec/utils/parser"
require "inspec/utils/filter"

module Inspec::Resources
  class Crontab < Inspec.resource(1)
    name "crontab"
    supports platform: "unix"
    desc "Use the crontab InSpec audit resource to test the contents of the crontab for a given user which contains information about scheduled tasks owned by that user."
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

    include Inspec::Utils::CommentParser

    def initialize(opts = nil)
      if opts.respond_to?(:fetch)
        Hash[opts.map { |k, v| [k.to_sym, v] }]
        @user = opts.fetch(:user, nil)
        @path = opts.fetch(:path, nil)
        raise Inspec::Exceptions::ResourceFailed, "A user or path must be supplied." if @user.nil? && @path.nil?
        raise Inspec::Exceptions::ResourceFailed, "Either user or path must be supplied, not both!" if !@user.nil? && !@path.nil?
      else
        @user = opts
        @path = nil
      end
      @params = read_crontab
    end

    def read_crontab
      if is_system_crontab?
        raise Inspec::Exceptions::ResourceFailed, "Supplied crontab path '#{@path}' must exist!" unless inspec.file(@path).exist?

        ct = inspec.file(@path).content
      else
        ct = inspec.command(crontab_cmd).stdout
      end
      ct.lines.map { |l| parse_crontab_line(l) }.compact
    end

    def parse_crontab_line(l)
      data, = parse_comment_line(l, comment_char: "#", standalone_comments: false)
      return nil if data.nil? || data.empty?

      is_system_crontab? ? parse_system_crontab(data) : parse_user_crontab(data)
    end

    def crontab_cmd
      if @user.nil?
        "crontab -l"
      elsif inspec.os.aix?
        "crontab -l #{@user}"
      else
        # TODO: the -u scenario needs to be able to do sudo
        "crontab -l -u #{@user}"
      end
    end

    filter = FilterTable.create
    filter.register_column(:minutes, field: "minute")
      .register_column(:hours,    field: "hour")
      .register_column(:days,     field: "day")
      .register_column(:months,   field: "month")
      .register_column(:weekdays, field: "weekday")
      .register_column(:user,     field: "user")
      .register_column(:commands, field: "command")

    # rebuild the crontab line from raw content
    filter.register_custom_property(:content) do |t, _|
      t.entries.map do |e|
        [e.minute, e.hour, e.day, e.month, e.weekday, e.user, e.command].compact.join(" ")
      end.join("\n")
    end

    filter.install_filter_methods_on_resource(self, :params)

    def to_s
      if is_system_crontab?
        "crontab for path #{@path}"
      elsif is_user_crontab?
        "crontab for user #{@user}"
      else
        "crontab for current user"
      end
    end

    private

    def is_system_crontab?
      !@path.nil?
    end

    def is_user_crontab?
      !@user.nil?
    end

    # rubocop:disable Layout/AlignHash

    DEFAULT_TIMES = {
      "minute"  => "*",
      "hour"    => "*",
      "day"     => "*",
      "month"   => "*",
      "weekday" => "*",
    }.freeze

    SYSTEM_COLUMNS = %w{minute hour day month weekday user command}.freeze
    USER_COLUMNS = %w{minute hour day month weekday command}.freeze

    HOURLY  = { "minute" => "0" }.freeze
    DAILY   = HOURLY  .merge("hour"    => "0").freeze
    WEEKLY  = HOURLY  .merge("weekday" => "0").freeze
    MONTHLY = DAILY   .merge("day"     => "1").freeze
    YEARLY  = MONTHLY .merge("month"   => "1").freeze
    REBOOT  = {
      "minute"  => "-1",
      "hour"    => "-1",
      "day"     => "-1",
      "month"   => "-1",
      "weekday" => "-1",
    }.freeze

    def merge_crontab(data, default)
      case data
      when /@hourly /
        default.merge(HOURLY)
      when /@(midnight|daily) /
        default.merge(DAILY)
      when /@weekly /
        default.merge(WEEKLY)
      when /@monthly /
        default.merge(MONTHLY)
      when /@(annually|yearly) /
        default.merge(YEARLY)
      when /@reboot /
        default.merge(REBOOT)
      end
    end

    def parse_system_crontab(data)
      _, user, cmd = data.split(/\s+/, 3)
      default = DEFAULT_TIMES.merge("user"    => user,
                                    "command" => cmd)

      merge_crontab(data, default) ||
        SYSTEM_COLUMNS.zip(data.split(/\s+/, 7)).to_h
    end

    def parse_user_crontab(data)
      _, cmd = data.split(/\s+/, 2)
      default = DEFAULT_TIMES.merge("user"    => @user,
                                    "command" => cmd)

      merge_crontab(data, default) ||
        USER_COLUMNS.zip(data.split(/\s+/, 6)).to_h.merge("user" => @user)
    end
  end
end
