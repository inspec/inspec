# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
#
# prepares services

# install ntp as a service on ubuntu
case node['platform']
when 'ubuntu'
  include_recipe('apt')
  package 'ntp'
end
