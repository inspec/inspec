# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

class Cmd < Vulcano.resource(1)
  name 'command'
  def initialize(cmd)
    @command = cmd
  end

  def result
    @result ||= vulcano.backend.run_command(@command)
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
    res = vulcano.backend.run_command("type \"#{@command}\" > /dev/null")
    res.exit_status.to_i == 0
  end

  def to_s
    "Command #{@command}"
  end
end
