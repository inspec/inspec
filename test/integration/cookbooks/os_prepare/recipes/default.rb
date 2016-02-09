# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
#
# prepare all operating systems with the required configuration


# basic tests
include_recipe('os_prepare::file')
include_recipe('os_prepare::mount')
include_recipe('os_prepare::service')
include_recipe('os_prepare::package')
include_recipe('os_prepare::registry_key')
include_recipe('os_prepare::iptables')

# configure repos, eg. nginx
include_recipe('os_prepare::apt')

# application configuration
include_recipe('os_prepare::postgres')
include_recipe('os_prepare::auditctl')
include_recipe('os_prepare::apache')

# config file parsing
include_recipe('os_prepare::json_yaml_csv_ini')
