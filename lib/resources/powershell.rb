# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH

module Inspec::Resources
  class PowershellScript < Cmd
    name 'powershell'
    supports platform: 'windows'
    desc 'Use the powershell InSpec audit resource to test a Windows PowerShell script on the Microsoft Windows platform.'
    example "
      script = <<-EOH
        # your powershell script
      EOH

      describe powershell(script) do
        its('matcher') { should eq 'output' }
      end
    "

    def initialize(script)
      # since WinRM 2.0 and the default use of powershell for local execution in
      # train, we do not need to wrap the script here anymore
      super(script)
    end

    # we cannot determine if a command exists, because that does not work for scripts
    def exist?
      nil
    end

    # Removes leading and trailing whitespace from stdout
    def strip
      result.stdout&.strip
    end

    def to_s
      'Powershell'
    end
  end

  # this is deprecated syntax and will be removed in future versions
  class LegacyPowershellScript < PowershellScript
    name 'script'

    def initialize(script)
      deprecated
      super(script)
    end

    def deprecated
      warn '[DEPRECATION] `script(script)` is deprecated.  Please use `powershell(script)` instead.'
    end
  end
end
