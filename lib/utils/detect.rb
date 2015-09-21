# encoding: utf-8
#
# Copyright 2015, Vulcano Security GmbH
#
# Tiny test file to return OS info of the tested node

# print OS detection infos
conf = {
  os_name: os[:name],
  os_family: os[:family],
  os_release: release || os[:release],
  os_arch: os[:arch],
}
puts JSON.dump(conf)
exit 0
