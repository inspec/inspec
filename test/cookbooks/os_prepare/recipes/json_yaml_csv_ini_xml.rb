#
# adds a yaml file

['yml', 'json', 'csv', 'ini', 'toml', 'xml'].each { |filetype|

  if node['platform_family'] != 'windows'
    cookbook_file "/tmp/example.#{filetype}" do
      source "example.#{filetype}"
      mode '0755'
      action :create
    end
  else
    cookbook_file "C:/windows/temp/example.#{filetype}" do
      source "example.#{filetype}"
      action :create
    end
  end
}
