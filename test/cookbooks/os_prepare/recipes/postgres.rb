# encoding: utf-8
# author: Stephan Renatus
#
# installs everyting for the postgres tests

# hw-cookbooks/postgresql is tested on these platforms
case node['platform']
when 'ubuntu', 'centos'

  # also skip it on ubuntu 15.10, because the cookbook is not supported
  # with `enable_pgdg_apt` yet
  return if node['platform_version'] == "15.10"

  node.default['postgresql']['enable_pgdg_apt'] = true
  node.default['postgresql']['config']['listen_addresses'] = 'localhost'
  node.default['postgresql']['password']['postgres'] = 'md506be11be01439cb4abd537e454df34ea' # "inspec"
  include_recipe 'postgresql::server'
end
