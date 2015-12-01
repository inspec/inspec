# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

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

  def initialize(cmd)
    @command = cmd
  end

  def result
    @result ||= inspec.backend.run_command(@command)
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
    if inspec.os.linux?
      res = inspec.backend.run_command("bash -c 'type \"#{@command}\"'")
    elsif inspec.os.windows?
      res = inspec.backend.run_command("where.exe \"#{@command}\"")
    elsif inspec.os.unix?
      res = inspec.backend.run_command("type \"#{@command}\"")
    elsif inspec.os[:family].to_s == 'unknown'
      # silent for mock resources
      return false
    else
      warn "`command(#{@command}).exist?` is not suported on you OS: #{inspec.os[:family]}"
      return false
    end
    res.exit_status.to_i == 0
  end

  def to_s
    "Command #{@command}"
  end
end
