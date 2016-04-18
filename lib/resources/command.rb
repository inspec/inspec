# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

require 'shellwords'

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

    SHELLS = {
      'sh'   => ->(x, path = 'sh')   { path + ' -c ' + Shellwords.escape(x) },
      'bash' => ->(x, path = 'bash') { path + ' -c ' + Shellwords.escape(x) },
      'zsh'  => ->(x, path = 'zsh')  { path + ' -c ' + Shellwords.escape(x) },
    }.freeze

    attr_reader :command

    def initialize(cmd, opts = {})
      @command = cmd
      unless opts.is_a?(Hash)
        skip_resource "Called #{self} with invalid command options. See the resource help for valid examples."
        opts = {}
      end
      @opts = opts
    end

    def result
      @result ||= inspec.backend.run_command(wrap_cmd)
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

    private

    def wrap_cmd
      shell = @opts[:shell]
      return @command if shell.nil?

      wrapper = SHELLS[shell]
      # TODO: fail with an error if the command isn't found
      return @command if wrapper.nil?

      wrapper.call(@command)
    end
  end
end
