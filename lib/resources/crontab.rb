# encoding: utf-8
# author: Adam Leff

require 'utils/parser'
require 'utils/filter'

module Inspec::Resources
  class Crontab < Inspec.resource(1)
    name 'crontab'
    desc 'Use the crontab InSpec audit resource to test the contents of the crontab for a given user which contains information about scheduled tasks owned by that user.'
    example "
      describe crontab('root') do
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
    "

    attr_reader :params

    include CommentParser

    def initialize(user = nil)
      @user   = user
      @params = read_crontab

      return skip_resource 'The `crontab` resource is not supported on your OS.' unless inspec.os.unix?
    end

    def read_crontab
      inspec.command(crontab_cmd).stdout.lines.map { |l| parse_crontab_line(l) }.compact
    end

    def parse_crontab_line(l)
      data, = parse_comment_line(l, comment_char: '#', standalone_comments: false)
      return nil if data.nil? || data.empty?

      elements = data.split(/\s+/, 6)
      {
        'minute'  => elements.at(0),
        'hour'    => elements.at(1),
        'day'     => elements.at(2),
        'month'   => elements.at(3),
        'weekday' => elements.at(4),
        'command' => elements.at(5),
      }
    end

    def crontab_cmd
      @user.nil? ? 'crontab -l' : "crontab -l -u #{@user}"
    end

    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:minutes,  field: 'minute')
          .add(:hours,    field: 'hour')
          .add(:days,     field: 'day')
          .add(:months,   field: 'month')
          .add(:weekdays, field: 'weekday')
          .add(:commands, field: 'command')

    # rebuild the crontab line from raw content
    filter.add(:content) { |t, _|
      t.entries.map do |e|
        [e.minute, e.hour, e.day, e.month, e.weekday, e.command].join(' ')
      end.join("\n")
    }

    filter.connect(self, :params)

    def to_s
      @user.nil? ? 'crontab for current user' : "crontab for user #{@user}"
    end
  end
end
