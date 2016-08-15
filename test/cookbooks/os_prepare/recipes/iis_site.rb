# set up test site for iis_site resource

return unless node['platform_family'] == 'windows'

# make sure the iis windows feature is installed
dsc_script 'Web-Server' do
  code <<-EOH
  WindowsFeature InstallWebServer
  {
    Name = "Web-Server"
    Ensure = "Present"
  }
  EOH
end
