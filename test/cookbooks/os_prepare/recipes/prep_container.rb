# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
#
# prepares container for normal use :-)

# if package lsb-release & procps is not installed
# chef returns an empty node['lsb']['codename']
package %w(procps lsb-release) if platform_family?('debian')
