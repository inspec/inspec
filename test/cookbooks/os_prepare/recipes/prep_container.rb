# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
#
# prepares container for normal use :-)

# install docker pre-conditions
if ['ubuntu', 'debian'].include?(node['platform'])
  include_recipe('apt')

  # if package lsb-release & procps is not installed
  # chef returns an empty node['lsb']['codename']
  package("lsb-release")
  package("procps")
end
