# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

module Inspec::Resources
  class Cmd < Inspec.resource(1)
    name 'command'
    desc 'Use the command InSpec audit resource to test an arbitrary command that is run on the system.'
    example "
      describe command('ls -al /') do
        it { should exist }
        its(:stdout) { should match /bin/ }
        its('stderr') { should eq '' }
        its(:exit_status) { should eq 0 }
      end
    "

    attr_reader :command
    attr_reader :options

    def initialize(cmd, opts={})
      @command = cmd
      if opts.is_a?(String)
        warn "WARN: Ignoring invalid command option '#{opts}', use the 'option: value' format. For example: 'command(\"ls\", bash: true)'"
        opts = {}
      end
      @options = opts
    end

    def result
      if @options[:bash].to_s == "true"
        full_command = "bash -c #{Shellwords.escape(@command)}"
      else
        full_command = @command
      end
      @result ||= inspec.backend.run_command(full_command)
    end

    def stdout
      result.stdout
    end

    def stderr
      result.stderr
    end

    def exit_status
      result.exit_status.to_i
    end

    def exist?
      # silent for mock resources
      return false if inspec.os[:family].to_s == 'unknown'

      if inspec.os.linux?
        res = inspec.backend.run_command("bash -c 'type \"#{@command}\"'")
      elsif inspec.os.windows?
        res = inspec.backend.run_command("where.exe \"#{@command}\"")
      elsif inspec.os.unix?
        res = inspec.backend.run_command("type \"#{@command}\"")
      else
        warn "`command(#{@command}).exist?` is not suported on your OS: #{inspec.os[:family]}"
        return false
      end
      res.exit_status.to_i == 0
    end

    def to_s
      "Command #{@command}"
    end
  end
end
