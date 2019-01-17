# set up test site for iis resource

return unless node["platform_family"] == "windows"

# make sure the iis windows feature is installed
dsc_script "Web-Server" do
  code <<-EOH
  WindowsFeature InstallWebServer
  {
    Name = "Web-Server"
    Ensure = "Present"
  }
  EOH
end

directory "C:\\www\\inetpub\\Test" do
  recursive true
end

powershell_script "Create-WebApplication" do
  code <<-EOH
  Import-Module WebAdministration
  New-WebApplication -Name "TestApp" -Site 'Default Web Site' -PhysicalPath "C:\\www\\inetpub\\Test" -ApplicationPool "DefaultAppPool"
  EOH
end
