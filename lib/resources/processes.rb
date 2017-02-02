# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

require 'utils/filter'

module Inspec::Resources
  class Processes < Inspec.resource(1)
    name 'processes'
    desc 'Use the processes InSpec audit resource to test properties for programs that are running on the system.'
    example "
      describe processes('mysqld') do
        its('entries.length') { should eq 1 }
        its('users') { should eq ['mysql'] }
        its('states') { should include 'S' }
      end
      describe processes(/.+/).where { label != 'unconfined' && pid < 1000 } do
        its('users') { should cmp [] }
      end
    "

    def initialize(grep)
      @grep = grep
      # turn into a regexp if it isn't one yet
      if grep.class == String
        grep = '(/[^/]*)*' + grep if grep[0] != '/'
        grep = Regexp.new('^' + grep + '(\s|$)')
      end
      all_cmds = ps_axo
      @list = all_cmds.find_all do |hm|
        hm[:command] =~ grep
      end
    end

    def to_s
      "Processes #{@grep.class == String ? @grep : @grep.inspect}"
    end

    def list
      warn '[DEPRECATION] `processes.list` is deprecated. Please use `processes.entries` instead. It will be removed in version 2.0.0.'
      @list
    end

    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:labels,   field: 'label')
          .add(:pids,     field: 'pid')
          .add(:cpus,     field: 'cpu')
          .add(:mem,      field: 'mem')
          .add(:vsz,      field: 'vsz')
          .add(:rss,      field: 'rss')
          .add(:tty,      field: 'tty')
          .add(:states,   field: 'stat')
          .add(:start,    field: 'start')
          .add(:time,     field: 'time')
          .add(:users,    field: 'user')
          .add(:commands, field: 'command')
          .connect(self, :filtered_processes)

    private

    def filtered_processes
      @list
    end

    def ps_axo
      os = inspec.os

      if os.linux?
        command = 'ps axo label,pid,pcpu,pmem,vsz,rss,tty,stat,start,time,user:32,command'
        regex = /^([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+(\w{3} \d{2}|\d{2}:\d{2}:\d{2})\s+([^ ]+)\s+([^ ]+)\s+(.*)$/
      else
        command = 'ps axo pid,pcpu,pmem,vsz,rss,tty,stat,start,time,user,command'
        regex = /^\s*([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+(.*)$/
      end
      build_process_list(command, regex, os)
    end

    Process = Struct.new(:label, :pid,
                         :cpu, :mem, :vsz,
                         :rss, :tty, :stat,
                         :start, :time, :user, :command)

    def build_process_list(command, regex, os)
      cmd = inspec.command(command)
      all = cmd.stdout.split("\n")[1..-1]
      return [] if all.nil?
      lines = all.map do |line|
        line.match(regex)
      end.compact
      lines.map do |m|
        a = m.to_a[1..-1] # grab all matching groups
        a.unshift(nil) unless os.linux?
        a[1] = a[1].to_i
        a[4] = a[4].to_i
        a[5] = a[5].to_i
        Process.new(*a)
      end
    end
  end
end
