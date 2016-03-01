# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# we cannot use script control, because it works on 32 bit systems only
# $script = new-object -comobject MSScriptControl.ScriptControl
# $script.language = "vbscript"
# $script.ExecuteStatement($Cmd)
module Inspec::Resources
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

      cmd = <<-EOH
  $vbscript = @"
  #{vbscript}
  "@

  # create temp file
  $filename = [System.IO.Path]::GetTempFileName() + ".vbs"
  New-Item $filename -type file -force -value $vbscript  | Out-Null

  # run cscript with nologo option
  cscript.exe /nologo $filename

  EOH
      puts cmd
      super(cmd)
    end

    def to_s
      'Windows VBScript'
    end
  end
end
