# encoding: utf-8
# author: Christoph Hartmann

# install apache service
case node['platform']
when 'ubuntu', 'centos', 'amazon', 'fedora'

  return if node['platform_version'] == "15.10"

  httpd_service 'default' do
    action :create
  end

end
