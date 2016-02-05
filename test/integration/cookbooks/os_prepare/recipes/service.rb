# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
#
# prepares services

case node['platform']
when 'ubuntu'
  # install ntp as a service
  include_recipe 'apt::default'
  package 'ntp'

when 'centos'
  # install runit for alternative service mgmt
  include_recipe 'os_prepare::_runit_service_centos'
  include_recipe 'os_prepare::_upstart_service_centos'
end
