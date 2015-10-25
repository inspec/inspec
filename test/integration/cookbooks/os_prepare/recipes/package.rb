# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
#
# installs everything to do the package test

case node['platform']
when 'ubuntu'
  include_recipe('apt')

  package 'curl'
when 'rhel', 'centos', 'fedora'
  include_recipe('yum')

  # TODO: support DNF natively
  # Special care for fedora 22, since dnf is not officially supported yet
  # https://github.com/chef/chef/issues/3201
  if node['platform_version'] == '22'
    execute 'dnf install -y yum'
  end

  package 'curl'
when 'freebsd'
  # do nothing
  # TODO: implement Freebsd packages
end
