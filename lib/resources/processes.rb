# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

module Inspec::Resources
  class Processes < Inspec.resource(1)
    name 'processes'
    desc 'Use the processes InSpec audit resource to test properties for programs that are running on the system.'
    example "
      describe processes('mysqld') do
        its('list.length') { should eq 1 }
        its('users') { should eq ['mysql'] }
        its('states') { should include 'S' }
      end
    "

    attr_reader :list,
                :users,
                :states

    def initialize(grep)
      # turn into a regexp if it isn't one yet
      if grep.class == String
        grep = '(/[^/]*)*'+grep if grep[0] != '/'
        grep = Regexp.new('^' + grep + '(\s|$)')
      end
      all_cmds = ps_aux
      @list = all_cmds.find_all do |hm|
        hm[:command] =~ grep
      end

      { users: :user,
        states: :stat }.each do |var, key|
        instance_variable_set("@#{var}", @list.map { |l| l[key] }.uniq)
      end
    end

    def to_s
      'Processes'
    end

    private

    def ps_aux
      os = inspec.os

      if os.linux?
        command = 'ps auxZ'
        regex = /^([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+(.*)$/
      else
        command = 'ps aux'
        regex = /^([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+(.*)$/
      end
      build_process_list(command, regex, os)
    end

    Process = Struct.new(:label, :user, :pid,
                         :cpu, :mem, :vsz,
                         :rss, :tty, :stat,
                         :start, :time, :command)

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
        a[2] = a[2].to_i
        a[5] = a[5].to_i
        a[6] = a[6].to_i
        Process.new(*a)
      end
    end
  end
end
