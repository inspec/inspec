# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
#
# adds a yaml file

gid = case node["platform_family"]
      when "aix"
        "system"
      when "freebsd"
        "wheel"
      when "solaris", "solaris2"
        "sys"
      else
        "root"
      end

%w{yml json csv ini toml xml}.each do |filetype|

  if node["platform_family"] != "windows"
    cookbook_file "/tmp/example.#{filetype}" do
      source "example.#{filetype}"
      owner "root"
      group gid
      mode "0755"
      action :create
    end
  else
    cookbook_file "C:/windows/temp/example.#{filetype}" do
      source "example.#{filetype}"
      action :create
    end
  end
end
