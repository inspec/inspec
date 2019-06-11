#
# prepares services

case node["platform"]
when "ubuntu"
  # install ntp as a service
  package "ntp"

when "centos"
  # install runit for alternative service mgmt
  if node["platform_version"].to_i == 6
    include_recipe "os_prepare::_runit_service_centos" unless node["osprepare"]["docker"]
    include_recipe "os_prepare::_upstart_service_centos" unless node["osprepare"]["docker"]
  end
end
