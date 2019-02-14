# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
#
# installs everything to do the package test

case node['platform_family']
when 'debian'
  apt_update
  package 'curl'
when 'rhel', 'fedora', 'amazon'
  package 'curl'
when 'freebsd'
  # do nothing
  # TODO: implement Freebsd packages
end
