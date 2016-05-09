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

    def build_process_list(command, regex, os) # rubocop:disable MethodLength, Metrics/AbcSize
      cmd = inspec.command(command)
      all = cmd.stdout.split("\n")[1..-1]
      return [] if all.nil?

      lines = all.map do |line|
        line.match(regex)
      end.compact

      if os.linux?
        lines.map do |m|
          {
            label: m[1],
            user: m[2],
            pid: m[3].to_i,
            cpu: m[4],
            mem: m[5],
            vsz: m[6].to_i,
            rss: m[7].to_i,
            tty: m[8],
            stat: m[9],
            start: m[10],
            time: m[11],
            command: m[12],
          }
        end
      else
        lines.map do |m|
          {
            label: nil,
            user: m[1],
            pid: m[2].to_i,
            cpu: m[3],
            mem: m[4],
            vsz: m[5].to_i,
            rss: m[6].to_i,
            tty: m[7],
            stat: m[8],
            start: m[9],
            time: m[10],
            command: m[11],
          }
        end
      end
    end
  end
end
