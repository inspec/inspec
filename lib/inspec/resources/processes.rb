# copyright: 2015, Vulcano Security GmbH

require 'inspec/utils/filter'
require 'ostruct'

module Inspec::Resources
  class Processes < Inspec.resource(1)
    name 'processes'
    supports platform: 'unix'
    supports platform: 'windows'
    desc 'Use the processes InSpec audit resource to test properties for programs that are running on the system.'
    example <<~EXAMPLE
      describe processes('mysqld') do
        its('entries.length') { should eq 1 }
        its('users') { should eq ['mysql'] }
        its('states') { should include 'S' }
      end

      describe processes(/.+/).where { label != 'unconfined' && pid < 1000 } do
        its('users') { should cmp [] }
      end

      # work with all processes
      describe processes do
        its('entries.length') { should be <= 100 }
      end
    EXAMPLE

    def initialize(grep = /.*/)
      @grep = grep
      # turn into a regexp if it isn't one yet
      if grep.class == String
        # if windows ignore case as we can't make up our minds
        if inspec.os.windows?
          grep = '(?i)' + grep
        else
          grep = '(/[^/]*)*' + grep unless grep[0] == '/'
          grep = '^' + grep + '(\s|$)'
        end
        grep = Regexp.new(grep)
      end

      all_cmds = ps_axo
      @list = all_cmds.find_all do |hm|
        hm[:command] =~ grep
      end
    end

    def exists?
      !@list.empty?
    end

    def to_s
      "Processes #{@grep.class == String ? @grep : @grep.inspect}"
    end

    def list
      Inspec.deprecate(:property_processes_list, 'The processes `list` property is deprecated. Please use `entries` instead.')
      @list
    end

    filter = FilterTable.create
    filter.register_column(:labels,   field: 'label')
          .register_column(:pids,     field: 'pid')
          .register_column(:cpus,     field: 'cpu')
          .register_column(:mem,      field: 'mem')
          .register_column(:vsz,      field: 'vsz')
          .register_column(:rss,      field: 'rss')
          .register_column(:tty,      field: 'tty')
          .register_column(:states,   field: 'stat')
          .register_column(:start,    field: 'start')
          .register_column(:time,     field: 'time')
          .register_column(:users,    field: 'user')
          .register_column(:commands, field: 'command')
          .install_filter_methods_on_resource(self, :filtered_processes)

    private

    def filtered_processes
      @list
    end

    def ps_axo
      os = inspec.os

      if os.linux?
        command, regex, field_map = ps_configuration_for_linux
      elsif os.windows?
        command = '$Proc = Get-Process -IncludeUserName | Where-Object {$_.Path -ne $null } | Select-Object PriorityClass,Id,CPU,PM,VirtualMemorySize,NPM,SessionId,Responding,StartTime,TotalProcessorTime,UserName,Path | ConvertTo-Csv -NoTypeInformation;$Proc.Replace("""","").Replace("`r`n","`n")'
        # Wanted to use /(?:^|,)([^,]*)/; works on rubular.com not sure why here?
        regex = /^(.+),(.+),(.+),(.+),(.+),(.+),(.+),(.+),(.+),(.+),(.+),(.+)$/
        field_map = {
          pid: 2,
          cpu: 3,
          mem: 4,
          vsz: 5,
          rss: 6,
          tty: 7,
          stat: 8,
          start: 9,
          time: 10,
          user: 11,
          command: 12,
        }
      else
        command = 'ps axo pid,pcpu,pmem,vsz,rss,tty,stat,start,time,user,command'
        regex = /^\s*([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+(.*)$/
        field_map = {
          pid: 1,
          cpu: 2,
          mem: 3,
          vsz: 4,
          rss: 5,
          tty: 6,
          stat: 7,
          start: 8,
          time: 9,
          user: 10,
          command: 11,
        }
      end
      build_process_list(command, regex, field_map)
    end

    def ps_configuration_for_linux
      if busybox_ps?
        command = 'ps -o pid,vsz,rss,tty,stat,time,ruser,args'
        regex = /^\s*(\d+)\s+(\d+(?:\.\d+)?[gm]?)\s+(\d+(?:\.\d+)?[gm]?)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(.*)$/
        field_map = {
          pid: 1,
          vsz: 2,
          rss: 3,
          tty: 4,
          stat: 5,
          time: 6,
          user: 7,
          command: 8,
        }
      else
        command = 'ps axo label,pid,pcpu,pmem,vsz,rss,tty,stat,start,time,user:32,command'
        regex = /^(.+?)\s+(\d+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+(\w{3} \d{2}|\d{2}:\d{2}:\d{2})\s+([^ ]+)\s+([^ ]+)\s+(.*)$/
        field_map = {
          label: 1,
          pid: 2,
          cpu: 3,
          mem: 4,
          vsz: 5,
          rss: 6,
          tty: 7,
          stat: 8,
          start: 9,
          time: 10,
          user: 11,
          command: 12,
        }
      end

      [command, regex, field_map]
    end

    def busybox_ps?
      @busybox_ps ||= inspec.command('ps --help').stderr.include?('BusyBox')
    end

    def convert_to_kilobytes(param)
      return param.to_i unless param.is_a?(String)

      if param.end_with?('g')
        (param[0..-2].to_f * 1024 * 1024).to_i
      elsif param.end_with?('m')
        (param[0..-2].to_f * 1024).to_i
      else
        param.to_i
      end
    end

    def build_process_list(command, regex, field_map)
      cmd = inspec.command(command)
      all = cmd.stdout.split("\n")[1..-1]
      return [] if all.nil?

      # map all the process lines into match objects, fetch the available fields,
      # and then build an OpenStruct of the process data for each process
      all.map do |line|
        line = line.match(regex)

        # skip this line if we couldn't match the regular expression
        next if line.nil?

        # skip this entry if there's no command for this line
        next if line[field_map[:command]].nil?

        # build a hash of process data that we'll turn into a struct for FilterTable
        process_data = {}
        [:label, :pid, :cpu, :mem, :vsz, :rss, :tty, :stat, :start, :time, :user, :command].each do |param|
          # not all operating systems support all fields, so skip the field if we don't have it
          process_data[param] = line[field_map[param]] if field_map.key?(param)
        end

        # ensure pid, vsz, and rss are integers for backward compatibility
        process_data[:pid] = process_data[:pid].to_i if process_data.key?(:pid)

        # some ps variants (*cough* busybox) display vsz and rss as human readable MB or GB
        [:vsz, :rss].each do |param|
          next unless process_data.key?(param)
          process_data[param] = convert_to_kilobytes(process_data[param])
        end

        # strip any newlines off the command
        process_data[:command].strip!

        # return an OpenStruct of the process for future use by FilterTable
        OpenStruct.new(process_data)
      end.compact
    end
  end
end
