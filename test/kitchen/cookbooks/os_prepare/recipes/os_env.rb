#
# change a few Windows registry keys for testing purposes
if node["platform_family"] == "windows"
  powershell_script "Write User TEMP" do
    code <<-EOH
    [System.Environment]::SetEnvironmentVariable('TEMP', 'C:\\TEMPUSER', [System.environmentVariableTarget]::User)
    EOH
  end

  env "TEMP" do
    value 'C:\TEMPSYSTEM'
  end
end
