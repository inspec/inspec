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

  # we cannot determine if a command exists, because that does not work for scripts
  def exist?
    nil
  end
end
