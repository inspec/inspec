# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

class Script < Cmd
  name 'script'
  desc 'Use the script InSpec audit resource to test a Windows PowerShell script on the Microsoft Windows platform.'
  example "
    script = <<-EOH
      # you powershell script
    EOH

    describe script(script) do
      its('matcher') { should eq 'output' }
    end
  "

  def initialize(script)
    case inspec.os[:family]
    when 'windows'
      # encodes a script as base64 to run as powershell encodedCommand
      # this comes with performance issues: @see https://gist.github.com/fnichol/7b20596b950e65fb96f9
      require 'winrm'
      script = WinRM::PowershellScript.new(script)
      cmd = "powershell -encodedCommand #{script.encoded}"
    else
      cmd = ''
      return skip_resource 'The `script` resource is not supported on your OS yet.'
    end
    super(cmd)
  end

  # we cannot determine if a command exists, because that does not work for scripts
  def exist?
    nil
  end

  def to_s
    'Script'
  end
end
