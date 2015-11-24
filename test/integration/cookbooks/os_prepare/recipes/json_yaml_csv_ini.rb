# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
#
# adds a yaml file

gid = 'root'
gid = 'wheel' if node['platform_family'] == 'freebsd'

['yml', 'json', 'csv', 'ini'].each { |filetype|

  cookbook_file "/tmp/example.#{filetype}" do
    source "example.#{filetype}"
    owner 'root'
    group gid
    mode '0755'
    action :create
  end
}
