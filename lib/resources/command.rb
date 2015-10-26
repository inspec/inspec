# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

# Usage:
# describe command('ls -al /') do
#   it { should exist }
#   its(:stdout) { should match /bin/ }
#   its(:stderr) { should match /No such file or directory/ }
#   its(:exit_status) { should eq 0 }
# end

class Cmd < Inspec.resource(1)
  name 'command'
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
    res = inspec.backend.run_command("type \"#{@command}\" > /dev/null")
    res.exit_status.to_i == 0
  end

  def to_s
    "Command #{@command}"
  end
end
