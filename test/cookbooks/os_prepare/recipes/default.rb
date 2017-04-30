# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
#
# prepare all operating systems with the required configuration

# container preparation
include_recipe('os_prepare::prep_container')

# confgure ssh
include_recipe('os_prepare::ssh')

# basic tests
include_recipe('os_prepare::file')
include_recipe('os_prepare::mount') unless node['osprepare']['docker']
include_recipe('os_prepare::service')
include_recipe('os_prepare::package')
include_recipe('os_prepare::registry_key')
include_recipe('os_prepare::iis_site')
include_recipe('os_prepare::iptables') unless node['osprepare']['docker']
include_recipe('os_prepare::x509')
include_recipe('os_prepare::dh_params')

# config file parsing
include_recipe('os_prepare::json_yaml_csv_ini')

# configure repos, eg. nginx
include_recipe('os_prepare::apt')

# application configuration
if node['osprepare']['application'] && node['platform_family'] != 'windows'
  include_recipe('os_prepare::postgres')
  include_recipe('os_prepare::auditctl') unless node['osprepare']['docker']
  include_recipe('os_prepare::apache')
end

# docker host testing
include_recipe('os_prepare::docker_host') unless node['osprepare']['docker']
