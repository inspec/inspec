# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

class Script < Cmd
  name 'script'
  attr_accessor :command

  def initialize(script)
    case vulcano.os[:family]
    when 'windows'
      # encodes a script as base64 to run as powershell encodedCommand
      # this comes with performance issues: @see https://gist.github.com/fnichol/7b20596b950e65fb96f9
      require 'winrm'
      script = WinRM::PowershellScript.new(script)
      cmd = "powershell -encodedCommand #{script.encoded}"
    else
      return skip_resource 'The `script` resource is not supported on your OS yet.'
    end

    @command = cmd
  end

  def result
    @result ||= vulcano.command(@command)
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
end
