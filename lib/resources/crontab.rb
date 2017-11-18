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

    def initialize(destination = nil)
      @destination = destination
      @params = read_crontab

      return skip_resource 'The `crontab` resource is not supported on your OS.' unless inspec.os.unix?
    end

    def read_crontab
      inspec.command(crontab_cmd).stdout.lines.map { |l| parse_crontab_line(l) }.compact
    end

    def parse_crontab_line(l)
      data, = parse_comment_line(l, comment_char: '#', standalone_comments: false)
      return nil if data.nil? || data.empty?

      case data
      when /@hourly .*/
        { 'minute' => '0', 'hour' => '*', 'day' => '*', 'month' => '*', 'weekday' => '*', 'command' => data.split(/\s+/, 2).at(1) }
      when /@(midnight|daily) .*/
        { 'minute' => '0', 'hour' => '0', 'day' => '*', 'month' => '*', 'weekday' => '*', 'command' => data.split(/\s+/, 2).at(1) }
      when /@weekly .*/
        { 'minute' => '0', 'hour' => '0', 'day' => '*', 'month' => '*', 'weekday' => '0', 'command' => data.split(/\s+/, 2).at(1) }
      when /@monthly ./
        { 'minute' => '0', 'hour' => '0', 'day' => '1', 'month' => '*', 'weekday' => '*', 'command' => data.split(/\s+/, 2).at(1) }
      when /@(annually|yearly) .*/
        { 'minute' => '0', 'hour' => '0', 'day' => '1', 'month' => '1', 'weekday' => '*', 'command' => data.split(/\s+/, 2).at(1) }
      when /@reboot .*/
        { 'minute' => '-1', 'hour' => '-1', 'day' => '-1', 'month' => '-1', 'weekday' => '-1', 'command' => data.split(/\s+/, 2).at(1) }
      else
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
    end

    def crontab_cmd
      @destination.nil? ? 'crontab -l' : "crontab -l -u #{@destination}"
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
      @destination.nil? ? 'crontab for current user' : path_or_user
    end

    def path_or_user
      pou = path? ? 'path' : 'user'
      "crontab for #{pou} #{@destination}"
    end

    def path?
      @destination.include?('/')
    end
  end
end
