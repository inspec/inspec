# copyright: 2015, Vulcano Security GmbH

module Inspec::Resources
  class Powershell < Cmd
    name 'powershell'
    supports platform: 'windows'
    supports platform: 'unix'
    desc 'Use the powershell InSpec audit resource to test a Windows PowerShell script on the Microsoft Windows platform.'
    example <<~EXAMPLE
      script = <<-EOH
        # your powershell script
      EOH

      describe powershell(script) do
        its('matcher') { should eq 'output' }
      end
    EXAMPLE

    def initialize(script)
      # PowerShell is the default shell on Windows, use the `command` resource
      return super(script) if inspec.os.windows?

      unless inspec.command('pwsh').exist?
        raise Inspec::Exceptions::ResourceSkipped, 'Can not find `pwsh` command'
      end

      # Prevent progress stream from leaking into stderr
      command = "$ProgressPreference='SilentlyContinue';" + script

      # Encode as Base64 to remove any quotes/escapes/etc issues
      command = command.encode('UTF-16LE', 'UTF-8')
      command = Base64.strict_encode64(command)

      # Use the `command` resource to execute the command via `pwsh`
      super("pwsh -encodedCommand '#{command}'")
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

  PowershellScript = Powershell

  # this is deprecated syntax and will be removed in future versions
  class LegacyPowershell < Powershell
    name 'script'

    def initialize(script)
      Inspec.deprecate(:resource_script, 'The `script` resource is deprecated. Please use `powershell` instead.')
      super(script)
    end
  end

  LegacyPowershellScript = LegacyPowershell
end
