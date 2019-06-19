#
# installs everyting for the postgres tests

# sous-chefs/postgresql is tested on these platforms
case node["platform"]
when "ubuntu", "centos"
  node.default["postgresql"]["enable_pgdg_apt"] = true
  node.default["postgresql"]["config"]["listen_addresses"] = "localhost"
  node.default["postgresql"]["password"]["postgres"] = "md506be11be01439cb4abd537e454df34ea" # "inspec"
  include_recipe "postgresql::server"
end
