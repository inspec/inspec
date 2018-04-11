# encoding: utf-8
# author: Omar Irizarry
#
# change a few Windows registry keys for testing purposes
if node['platform_family'] == 'windows'
  powershell_script 'Write User TEMP' do
    code <<-EOH
    [System.Environment]::SetEnvironmentVariable('TEST', 'C:\\TEMPUSER', [System.environmentVariableTarget]::User)
    EOH
  end   
end

env 'TEST' do
  value 'C:\SYSTEMUSER'
end