# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'securerandom'

module Inspec::Resources
  # This resource allows users to run vbscript on windows machines. We decided
  # not to use scriptcontrol, due to the fact that it works on 32 bit systems only:
  # $script = new-object -comobject MSScriptControl.ScriptControl
  # $script.language = "vbscript"
  # $script.ExecuteStatement($Cmd)
  #
  # For that reason, we call csript.exe directy with the script. Vbscript is
  # embedded in Powershell to ease the file transfer and reuse powershell
  # encodedCommand since train does not allow file upload yet.
  #
  # We run cscript with /nologo option to get the expected output only with the
  # version information.
  #
  # Since Windows does not delete tmp files automatically, we remove the VBScript
  # after we executed it
  # @see https://msdn.microsoft.com/en-us/library/aa364991.aspx
  class VBScript < PowershellScript
    name 'vbscript'
    desc ''
    example "
      script = <<-EOH
        # you vbscript
      EOH

      describe vbscript(script) do
        its('stdout') { should eq 'output' }
      end
    "

    def initialize(vbscript)
      return skip_resource 'The `vbscript` resource is not supported on your OS yet.' unless inspec.os.windows?
      @seperator = SecureRandom.uuid
      cmd = <<-EOH
$vbscript = @"
#{vbscript}
Wscript.Stdout.Write "#{@seperator}"
"@
$filename = [System.IO.Path]::GetTempFileName() + ".vbs"
New-Item $filename -type file -force -value $vbscript | Out-Null
cscript.exe /nologo $filename
Remove-Item $filename | Out-Null
EOH
      super(cmd)
    end

    def result
      @result ||= parse_stdout
    end

    def to_s
      'Windows VBScript'
    end

    private

    def parse_stdout
      res = inspec.backend.run_command(@command)
      parsed_result = res.stdout.gsub(/#{@seperator}\r\n$/, '')
      res.stdout = parsed_result
      res
    end
  end
end
