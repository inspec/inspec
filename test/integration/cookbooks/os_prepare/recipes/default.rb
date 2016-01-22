# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
#
# prepare all operating systems with the required configuration

include_recipe('os_prepare::apt')
include_recipe('os_prepare::file')
include_recipe('os_prepare::mount')
include_recipe('os_prepare::json_yaml_csv_ini')
include_recipe('os_prepare::package')
include_recipe('os_prepare::registry_key')
include_recipe('os_prepare::service')
include_recipe('os_prepare::postgres')
include_recipe('os_prepare::auditctl')
